
open Ast
open State

exception Unimplemented
exception TypeMismatch
exception CompileError of string
exception FatalError of string

let context = Llvm.global_context ()
let the_module = Llvm.create_module context "main"
let builder = Llvm.builder context

(* type defs? *)
let i32 = Llvm.i32_type context
let bool = Llvm.i1_type context
let float = Llvm.float_type context
let void = Llvm.void_type context

[@@@ocaml.warning "-26-27" ] (* suppress unused during development bc its annoying *)

let to_lltype = function
| TVoid -> void
| TBool -> bool
| TInt -> i32
| TFloat -> float
(* | TCustom _ -> struct (??) *)
| _ -> raise (FatalError "no lltype exists for this type")


(* a better promotion system will have to be devised *)
let promote_to_float a b = (Llvm.build_sitofp a float "tmpfloat" builder, Llvm.build_sitofp b float "tmpfloat" builder)

let rec codegen_expr (e:expression) (state:PrgmSt.t) : Llvm.llvalue * typ =
  match e with
  | Bool(b)   -> Llvm.const_int bool (if b then 1 else 0), TBool
  | Int(x)    -> Llvm.const_int i32 x, TInt
  | Float(x)  -> Llvm.const_float float x, TFloat
  | String(s) -> raise Unimplemented

  | Array(vals) -> raise Unimplemented

  | Add(a, b) -> codegen_arithmetic_op ~i:Llvm.build_add ~f:Llvm.build_fadd a b "addtmp" state
  | Sub(a, b) -> codegen_arithmetic_op ~i:Llvm.build_sub ~f:Llvm.build_fadd a b "subtmp" state
  | Mul(a, b) -> codegen_arithmetic_op ~i:Llvm.build_mul ~f:Llvm.build_fmul a b "multmp" state
  | Div(a, b) -> codegen_arithmetic_op ~i:Llvm.build_sdiv ~f:Llvm.build_fdiv a b "divtmp" state

  | And(a, b) -> codegen_bool_op ~f:Llvm.build_and a b "andtmp" state
  | Or(a, b)  -> codegen_bool_op ~f:Llvm.build_or a b "ortmp" state
  | Not(b) -> let (value, t) = (codegen_expr b state) in if t <> TBool then raise TypeMismatch else
    Llvm.build_not value "nottmp" builder, TBool

  | Equals(a, b) -> codegen_equal ~i:(Llvm.build_icmp Llvm.Icmp.Eq) ~f:(Llvm.build_fcmp Llvm.Fcmp.Ueq) a b "eqtmp" state
  | NotEquals(a, b) -> codegen_equal ~i:(Llvm.build_icmp Llvm.Icmp.Ne) ~f:(Llvm.build_fcmp Llvm.Fcmp.Une) a b "neqtmp" state
  | Less(a, b) -> codegen_compare ~i:(Llvm.build_icmp Llvm.Icmp.Slt) ~f:(Llvm.build_fcmp Llvm.Fcmp.Ult) a b "lttmp" state
  | LessEq(a, b) -> codegen_compare ~i:(Llvm.build_icmp Llvm.Icmp.Sle) ~f:(Llvm.build_fcmp Llvm.Fcmp.Ule) a b "letmp" state
  | Greater(a, b) -> codegen_compare ~i:(Llvm.build_icmp Llvm.Icmp.Sgt) ~f:(Llvm.build_fcmp Llvm.Fcmp.Ugt) a b "gttmp" state
  | GreaterEq(a, b) -> codegen_compare ~i:(Llvm.build_icmp Llvm.Icmp.Sge) ~f:(Llvm.build_fcmp Llvm.Fcmp.Uge) a b "getmp" state

  | Ternary(condition, on_then, on_else) -> raise Unimplemented

  (* this will not work for op overloads or anything unless struct type *)
  | Access(Var name) -> let (value, t) = PrgmSt.find_var state name in Llvm.build_load (to_lltype t) value name builder, t
      
  
  | _ -> raise Unimplemented

(* all of these feel too similar *)
and codegen_arithmetic_op ~i ~f a b name state =
  let ((ea, ta), (eb, tb)) = (codegen_expr a state, codegen_expr b state) in
  match ta, tb with (* this part is a little bad but okay *)
  | TFloat, TFloat -> f ea eb name builder, TFloat
  | TFloat, TInt | TInt, TFloat -> let (fa, fb) = promote_to_float ea eb in f fa fb name builder, TFloat (* technically slower than it has to be *)
  | TInt, TInt -> i ea eb name builder, TInt
  | _ -> raise Unimplemented (* operartor overload?? *)
  
and codegen_bool_op ~f a b name state =
  let ((ea, ta), (eb, tb)) = (codegen_expr a state, codegen_expr b state) in
  match ta, tb with
  | TBool, TBool -> f ea eb name builder, TBool
  | _ -> raise TypeMismatch

and codegen_equal ~i ~f a b name state =
  let ((ea, ta), (eb, tb)) = (codegen_expr a state, codegen_expr b state) in
  (match ta, tb with
  | TFloat, TFloat -> f ea eb name builder
  | TFloat, TInt | TInt, TFloat -> let (fa, fb) = promote_to_float ea eb in f fa fb name builder
  | TInt, TInt | TBool, TBool -> i ea eb name builder
  | _ -> raise Unimplemented), TBool

and codegen_compare ~i ~f a b name state = (* me when i repeat myself *)
  let ((ea, ta), (eb, tb)) = (codegen_expr a state, codegen_expr b state) in
  (match ta, tb with
  | TFloat, TFloat -> f ea eb name builder
  | TFloat, TInt | TInt, TFloat -> let (fa, fb) = promote_to_float ea eb in f fa fb name builder
  | TInt, TInt -> i ea eb name builder
  | _ -> raise Unimplemented), TBool


let entry_block_alloca func name typ =
  func |> Llvm.entry_block |> Llvm.instr_begin |> Llvm.builder_at context |> (* she line on my pipe til i ocam *)
  Llvm.build_alloca (to_lltype typ) name

(* gah i hate side effects and this func not having a return *)
let rec codegen_statement (s:statement) (state:PrgmSt.t) (return_type:typ) = 
  match s with
  | Scope(sl) -> let new_state = PrgmSt.push_stack state in codegen_scope sl new_state return_type
  | ExpressionStatement(e) -> (codegen_expr e state) |> ignore; state (* might have a secondary thing for exprs with side effects *)

  | VarDefinition(_, t, name, value) -> 
    let parent_func = Llvm.block_parent (Llvm.insertion_block builder) in 
    let alloca = 
      (match PrgmSt.find_var_opt state name with
      | Some _ -> raise (CompileError "a variable with this name already exists")
      | None -> entry_block_alloca parent_func name t) in 
      let new_state = PrgmSt.add_var state name (alloca, t) in
      let v = 
        (match value with
        | Some e -> fst(codegen_expr e state)
        | None -> t |> to_lltype |> Llvm.const_null) in Llvm.build_store v alloca builder |> ignore;
        new_state

  | MethodDefinition(_, t, name, params, body) -> codegen_function t name params body state
  | Return(e) -> 
    (match e with 
    | Some v -> 
      let return_val, expr_type = codegen_expr v state in
      if expr_type <> return_type then 
        raise (CompileError "returned expression does not match function return type") else
        Llvm.build_ret return_val builder
    | None ->
      if return_type <> TVoid then
        raise (CompileError "non void function must return an expression") else
        Llvm.build_ret_void builder) |> ignore; state

  | _ -> raise Unimplemented



and codegen_scope (scope:statement list) (state:PrgmSt.t) return_type = 
  match scope with
  | x :: xs -> let new_state = codegen_statement x state return_type in codegen_scope xs new_state return_type
  | [] -> PrgmSt.pop_stack state
and codegen_function return_type name (params:(typ * string) list) body state =
  (*  |> ignore; *) (* not sure if nec (probably not because yeah) *)
  
  let param_types = Array.of_list (List.map (fun p -> p |> fst |> to_lltype) params) in
  let func_type = Llvm.function_type (to_lltype return_type) param_types in
  let the_function = Llvm.declare_function name func_type the_module in

  let entry_block = Llvm.append_block context "entry" the_function in
  Llvm.position_at_end entry_block builder;

  List.iteri (fun i (ty, param_name) ->
    let param = Llvm.param the_function i in
    Llvm.set_value_name param_name param;
    let alloca = entry_block_alloca the_function param_name ty in
    Llvm.build_store param alloca builder |> ignore;
    PrgmSt.add_var state param_name (alloca, ty) |> ignore;
  ) params;

  let new_state = PrgmSt.push_stack state in 
  let final_state = codegen_scope body state return_type in
  (* List.iter (fun s -> codegen_statement s state return_type) body; *)

  (* this should actually just cause a compile error unless void *)
  if Llvm.block_terminator (Llvm.insertion_block builder) = None then
    if return_type = TVoid then (Llvm.build_ret_void builder |> ignore; final_state) else
      raise (CompileError "non-void function does not return") else
    
  final_state

