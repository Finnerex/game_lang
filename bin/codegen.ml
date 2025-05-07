
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
| TPointer _ -> Llvm.pointer_type context
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
  | Sub(a, b) -> codegen_arithmetic_op ~i:Llvm.build_sub ~f:Llvm.build_fadd a b "subtmp" state (* what the helly *)
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

  | PostIncrement(Var name) ->
    let value, t = PrgmSt.find_var state name in let load = Llvm.build_load (to_lltype t) value name builder in
    let incr = Llvm.build_add load (fst(codegen_expr (Int 1) state)) "tmppostincr" builder in (* TODO: floats can also be incremented *)
    Llvm.build_store incr value builder |> ignore; load, t
  | PreIncrement(Var name) ->
    let value, t = PrgmSt.find_var state name in let load = Llvm.build_load (to_lltype t) value name builder in
    let incr = Llvm.build_add load (fst(codegen_expr (Int 1) state)) "tmppreincr" builder in
    Llvm.build_store incr value builder |> ignore; incr, t


  | Ternary(condition, if_then, if_else) -> raise Unimplemented

  (* this will not work for op overloads or anything unless struct type *)
  (* this is also like bad because it will load it a bunch when it doesnt need to *)
  | Access(Var name) -> let (value, t) = PrgmSt.find_var state name in Llvm.build_load (to_lltype t) value name builder, t

  | FunctionCall(name, args) ->
    let arg_array = args |> Array.of_list |> Array.map (fun a -> codegen_expr a state) in
    let expr_args = arg_array |> Array.map (fun a -> fst a) in (* should likely typecheck here *)
    let (the_function, return_type) = PrgmSt.find_func state name in 
    let func_type = arg_array |> Array.map (fun a -> a |> snd |> to_lltype) |> Llvm.function_type (to_lltype return_type) in
    let tmp_name = if return_type = TVoid then "" else "calltmp" in
    Llvm.build_call func_type the_function expr_args tmp_name builder, return_type
      
  
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
let rec codegen_statement (s:statement) (state:PrgmSt.t) (ctrl_state:CtrlSt.t) = 
  match s with
  | Scope(sl) -> let new_state = PrgmSt.push_stack state in codegen_scope sl new_state ctrl_state
  | ExpressionStatement(e) -> (codegen_expr e state) |> ignore; state (* might have a secondary thing for exprs with side effects *)

  | VarDefinition(_, t, name, value) -> 
    let parent_func = Llvm.block_parent (Llvm.insertion_block builder) in 
    let alloca = 
      (match PrgmSt.find_var_opt state name with
      | Some _ -> raise (CompileError "a variable with this name already exists")
      | None -> entry_block_alloca parent_func name t) in 
      PrgmSt.add_var state name (alloca, t) |> ignore;
      let v = 
        (match value with (* promotion will have to happen here at some point *)
        | Some e -> let (expr_value, expr_type) = codegen_expr e state in if expr_type <> t then
          raise (CompileError "variable type does not match assigned expression's type") else expr_value
        | None -> t |> to_lltype |> Llvm.const_null) in Llvm.build_store v alloca builder |> ignore;
        state

  | Assign(Var(name), e) ->
    let (var_value, var_type) = PrgmSt.find_var state name in 
    let (expr_value, expr_type) = codegen_expr e state in
    if var_type <> expr_type then raise (CompileError "variable type does not match assigned expression's type") else (* TODO: deal with promotion *)
    Llvm.build_store expr_value var_value builder |> ignore; state

  | MethodDefinition(_, t, name, params, body) -> codegen_function t name params body state ctrl_state

  | Return(e) -> 
    (match e with 
    | Some v -> 
      let return_val, expr_type = codegen_expr v state in
      if expr_type <> CtrlSt.get_fun_type ctrl_state then 
        raise (CompileError "returned expression does not match function return type") else
        Llvm.build_ret return_val builder
    | None ->
      if CtrlSt.get_fun_type ctrl_state <> TVoid then
        raise (CompileError "non void function must return an expression") else
        Llvm.build_ret_void builder) |> ignore; state

  | If(condition, if_then, if_else) -> codegen_if condition if_then if_else ctrl_state state; state

  | For(init, condition, increment, body) -> codegen_for init condition increment body ctrl_state state; state
  | While(_) -> raise Unimplemented
  | DoWhile(_) -> raise Unimplemented

  | Break -> Llvm.build_br (CtrlSt.get_loop_end ctrl_state) builder |> ignore; state

  | _ -> raise Unimplemented


and codegen_scope (scope:statement list) (state:PrgmSt.t) ctrl_state = 
  match scope with
  | x :: xs -> let new_state = codegen_statement x state ctrl_state in codegen_scope xs new_state ctrl_state
  | [] -> PrgmSt.pop_stack state


and codegen_if condition if_then if_else ctrl_state state =
  let the_function = Llvm.block_parent (Llvm.insertion_block builder) in

  let cond_expr =
    match codegen_expr condition state with
    | v, TBool -> v
    | _ -> raise (CompileError "if statement condition must evaluate to bool")
  in

  (* the ordering here kinda sucks but it works and i dont know how to make it better *)
  let then_block = Llvm.append_block context "then" the_function in
  let tmp_else_block = if if_else <> None then Some(Llvm.append_block context "else" the_function) else None in
  let merge_block = Llvm.append_block context "endif" the_function in 
  
  let else_block = match tmp_else_block with None -> merge_block | Some b -> b in

  Llvm.build_cond_br cond_expr then_block else_block builder |> ignore;

  Llvm.position_at_end then_block builder;
  codegen_statement if_then state ctrl_state |> ignore; (* i think i can ignore any state change *)
  Llvm.build_br merge_block builder |> ignore;

  (match if_else with
  | None -> ()
  | Some el -> 
    (Llvm.position_at_end else_block builder;
    codegen_statement el state ctrl_state |> ignore;
    Llvm.build_br merge_block builder |> ignore)); 

  Llvm.position_at_end merge_block builder;

and codegen_for init condition increment body ctrl_state state = 
  let current_block = (Llvm.insertion_block builder) in
  let the_function = Llvm.block_parent current_block in

  let pushed_state = PrgmSt.push_stack state in
      
  let cond_block = Llvm.append_block context "forcond" the_function in
  let start_block = Llvm.append_block context "for" the_function in
  let end_block = Llvm.append_block context "endfor" the_function in

  let new_ctrl_st = CtrlSt.push_loop ctrl_state cond_block end_block in

  Llvm.position_at_end current_block builder;
  codegen_statement init pushed_state new_ctrl_st |> ignore;
  Llvm.build_br cond_block builder |> ignore;
  
  Llvm.position_at_end cond_block builder;
  let cond_expr =
    match codegen_expr condition pushed_state with
    | v, TBool -> v
    | _ -> raise (CompileError "for loop condition must evaluate to bool")
  in
  Llvm.build_cond_br cond_expr start_block end_block builder |> ignore;

  Llvm.position_at_end start_block builder;
  codegen_statement body pushed_state new_ctrl_st |> ignore;
  codegen_statement increment pushed_state new_ctrl_st |> ignore;
  Llvm.build_br cond_block builder |> ignore;

  CtrlSt.pop_loop new_ctrl_st |> ignore;

  Llvm.position_at_end end_block builder;
  

and codegen_function return_type name (params:(typ * string) list) body state ctrl_state =
  
  let the_function = codegen_function_decl return_type name params state in

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
  let final_state = codegen_scope body new_state (CtrlSt.set_fun_type ctrl_state return_type) in
  (* List.iter (fun s -> codegen_statement s state return_type) body; *)

  (* this should actually just cause a compile error unless void *)
  if Llvm.block_terminator (Llvm.insertion_block builder) = None then
    if return_type = TVoid then Llvm.build_ret_void builder |> ignore else
      raise (CompileError "non-void function does not return");
  
  final_state

and codegen_function_decl return_type name (params:(typ * string) list) state = 
  let param_types = Array.of_list (List.map (fun p -> p |> fst |> to_lltype) params) in
  let func_type = Llvm.function_type (to_lltype return_type) param_types in
  (* let mangled_name = name ^ Array.fold_left (fun last t -> last ^ "_" ^ (Llvm.string_of_lltype t)) "" param_types in *)
  let the_function = Llvm.declare_function name func_type the_module in

  (* TODO: will have to check for existing declarations *)
  PrgmSt.add_func state name (the_function, return_type) |> ignore;
  the_function


  (* returns a state associated with the given class (as a list of method and var defs) *)
let rec collect_class (sl:statement list) (state:PrgmSt.t) : PrgmSt.t =
  match sl with
  | [] -> state
  | x :: xs -> 
    match x with
    | MethodDefinition(_, t, name, params, _) -> codegen_function_decl t name params state |> ignore; collect_class xs state
    | VarDefinition(_) -> raise Unimplemented
    | _ -> raise (FatalError "unexpected classlevel statement")
