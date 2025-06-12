
open Ast
open State
open Util

[@@@ocaml.warning "-26-27" ] (* suppress unused during development bc its annoying *)

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
  | Mod(a, b) -> codegen_arithmetic_op ~i:Llvm.build_srem ~f:Llvm.build_frem a b "modtmp" state

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
    let value, t = PrgmSt.find_var state name in let load = Llvm.build_load (to_lltype t state) value name builder in
    let incr = Llvm.build_add load (fst(codegen_expr (Int 1) state)) "tmppostincr" builder in (* TODO: floats can also be incremented *)
    Llvm.build_store incr value builder |> ignore; load, t
  | PreIncrement(Var name) ->
    let value, t = PrgmSt.find_var state name in let load = Llvm.build_load (to_lltype t state) value name builder in
    let incr = Llvm.build_add load (fst(codegen_expr (Int 1) state)) "tmppreincr" builder in
    Llvm.build_store incr value builder |> ignore; incr, t

  | Ternary(condition, if_then, if_else) -> codegen_ternary condition if_then if_else state

  (* this will not work for op overloads or anything unless struct type *)
  (* this is also like bad because it will load it a bunch when it doesnt need to *)
  | Access(Var name) -> let (value, t) = PrgmSt.find_var state name in Llvm.build_load (to_lltype t state) value name builder, t
  | Access(Field(x, name)) -> 
    let expr, t = codegen_expr x state in
    let expr, structName = 
      (match t with
      | TCustom n -> (* pointer to *) expr, n
      | TPointer(TCustom n) -> expr, n (* already pointer *)
      | _ -> raise Unimplemented) in
    (* TODO: base of gep must be a pointer *)
    let idx, ftype = (PrgmSt.find_field state structName name) in
    Llvm.build_struct_gep (PrgmSt.find_type state structName) expr idx (structName ^ name) builder, ftype

  | FunctionCall(Var name, args) -> (* function (no dot) *)
    let arg_exprs, arg_ts = args |> Array.of_list |> Array.map (fun a -> codegen_expr a state) |> Array.split in

    let mangled_name = mangle_method_name state.current_class_name name arg_ts in (* use enclosing class as the class name *)
    let the_function, return_type = match PrgmSt.find_static_opt state mangled_name with
    Some(f, t) -> f, t | None -> PrgmSt.find_func state mangled_name in 
    
    let func_type = arg_ts |> Array.map (fun a -> to_lltype a state) |> Llvm.function_type (to_lltype return_type state) in
    let tmp_name = if return_type = TVoid then "" else "calltmp" in
    Llvm.build_call func_type the_function arg_exprs tmp_name builder, return_type
      
  | FunctionCall(Field (x, name), args) -> (* method with dot *)
    let expr, t = (match x with
      | Access (Var v) ->
        if PrgmSt.has_type state v then None, TCustom v else
        let expr, t = codegen_expr x state in Some expr, t
      | _ -> let expr, t = codegen_expr x state in Some expr, t
    ) in
     
    let arg_exprs, arg_ts = args |> Array.of_list |> Array.map (fun a -> codegen_expr a state) |> Array.split in
    let mangled_name = (match t with
      | TCustom s_name -> mangle_method_name s_name name arg_ts
      | _ -> raise (FatalError "method called on non-custom type") (* or maybe things can happen *)) in
  
    (* "expr" should be the first of the args if not static *)
    let the_function, return_type = match expr with 
    | Some _ -> PrgmSt.find_func state mangled_name 
    | None -> PrgmSt.find_static state mangled_name in

    let func_type = arg_ts |> Array.map (fun a -> to_lltype a state) |> Llvm.function_type (to_lltype return_type state) in
    let tmp_name = if return_type = TVoid then "" else "calltmp" in
    Llvm.build_call func_type the_function arg_exprs tmp_name builder, return_type
    
  | ConstructorCall(t, args) ->
    let llt = PrgmSt.find_type state (match t with TCustom(x) -> x | _ -> raise Unimplemented) in
    Llvm.const_named_struct llt [||], t (* TODO: init correctly and call constructor *)

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

and codegen_ternary condition then_expr else_expr state = (* this file is getting a little ginormous *)
let the_function = Llvm.block_parent (Llvm.insertion_block builder) in

let cond_expr =
  match codegen_expr condition state with
  | v, TBool -> v
  | _ -> raise (CompileError "if expression condition must evaluate to bool")
in

let then_block = Llvm.append_block context "ternthen" the_function in
let else_block = Llvm.append_block context "ternelse" the_function in
let merge_block = Llvm.append_block context "endtern" the_function in 

Llvm.build_cond_br cond_expr then_block else_block builder |> ignore;

Llvm.position_at_end then_block builder;
let then_val, then_t = codegen_expr then_expr state in
Llvm.build_br merge_block builder |> ignore;

Llvm.position_at_end else_block builder;
let else_val, else_t = codegen_expr else_expr state in
Llvm.build_br merge_block builder |> ignore; 

if else_t <> then_t then raise (CompileError "Type mismatch") else ();

Llvm.position_at_end merge_block builder;
Llvm.build_phi [(then_val, then_block); (else_val, else_block)] "terntmp" builder, then_t



(* gah i hate side effects *)
let rec codegen_statement (s:statement) (state:PrgmSt.t) = 
  match s with
  | Scope(sl) -> let new_state = PrgmSt.push_stack state in codegen_scope sl new_state
  | ExpressionStatement(e) -> (codegen_expr e state) |> ignore; state (* might have a secondary thing for exprs with side effects *)

  | VarDefinition(_, t, name, value) -> 
    let parent_func = Llvm.block_parent (Llvm.insertion_block builder) in 
    let alloca = 
      (match PrgmSt.find_var_opt state name with
      | Some _ -> raise (CompileError "a variable with this name already exists")
      | None -> entry_block_alloca parent_func name t state) in 
      PrgmSt.add_var state name (alloca, t) |> ignore;
      let v = 
        (match value with (* promotion will have to happen here at some point *)
        | Some e -> let (expr_value, expr_type) = codegen_expr e state in if expr_type <> t then
          raise (CompileError "variable type does not match assigned expression's type") else expr_value
        | None -> (to_lltype t state) |> Llvm.const_null) in Llvm.build_store v alloca builder |> ignore;
        state

  | Assign(Var(name), e) ->
    let (var_value, var_type) = PrgmSt.find_var state name in 
    let (expr_value, expr_type) = codegen_expr e state in
    if var_type <> expr_type then raise (CompileError "variable type does not match assigned expression's type") else (* TODO: deal with promotion *)
    Llvm.build_store expr_value var_value builder |> ignore; state

  | MethodDefinition(modifiers, t, name, params, body) -> codegen_function modifiers t name params body state

  | Return(e) -> 
    (match e with 
    | Some v -> 
      let return_val, expr_type = codegen_expr v state in
      if expr_type <> state.function_ret_type then 
        raise (CompileError "returned expression does not match function return type") else
        Llvm.build_ret return_val builder
    | None ->
      if state.function_ret_type <> TVoid then
        raise (CompileError "non void function must return an expression") else
        Llvm.build_ret_void builder) |> ignore; state

  | If(condition, if_then, if_else) -> codegen_if condition if_then if_else state; state

  | For(init, condition, increment, body) -> codegen_for init condition increment body state; state
  | While(condition, body) -> codegen_while condition body false state; state 
  | DoWhile(condition, body) -> codegen_while condition body true state; state

  | Break -> Llvm.build_br (PrgmSt.get_loop_break state) builder |> ignore; state
  | Continue -> Llvm.build_br (PrgmSt.get_loop_cont state) builder |> ignore; state

  (* | StructureDefinition(_) -> codegen_structure s state *)

  | _ -> raise Unimplemented


and codegen_scope (scope:statement list) (state:PrgmSt.t) = 
  match scope with
  | x :: xs -> let new_state = codegen_statement x state in codegen_scope xs new_state
  | [] -> PrgmSt.pop_stack state


and codegen_if condition if_then if_else state =
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
  codegen_statement if_then state |> ignore; (* i think i can ignore any state change *)
  Llvm.build_br merge_block builder |> ignore;

  (match if_else with
  | None -> ()
  | Some el -> 
    (Llvm.position_at_end else_block builder;
    codegen_statement el state |> ignore;
    Llvm.build_br merge_block builder |> ignore)); 

  Llvm.position_at_end merge_block builder;

and codegen_for init condition increment body state = 
  let current_block = (Llvm.insertion_block builder) in
  let the_function = Llvm.block_parent current_block in
    
  let cond_block = Llvm.append_block context "forcond" the_function in
  let start_block = Llvm.append_block context "for" the_function in
  let increment_block = Llvm.append_block context "forinc" the_function in
  let end_block = Llvm.append_block context "endfor" the_function in

  let new_state = PrgmSt.push_stack state in
  let new_state = PrgmSt.set_loop_blocks new_state end_block increment_block in

  Llvm.position_at_end current_block builder;
  codegen_statement init new_state |> ignore;
  Llvm.build_br cond_block builder |> ignore;
  
  Llvm.position_at_end cond_block builder;
  let cond_expr =
    match codegen_expr condition new_state with
    | v, TBool -> v
    | _ -> raise (CompileError "for loop condition must evaluate to bool")
  in
  Llvm.build_cond_br cond_expr start_block end_block builder |> ignore;

  Llvm.position_at_end start_block builder;
  codegen_statement body new_state |> ignore;
  Llvm.build_br increment_block builder |> ignore;

  Llvm.position_at_end increment_block builder;
  codegen_statement increment new_state |> ignore;
  Llvm.build_br cond_block builder |> ignore;

  Llvm.position_at_end end_block builder;
  

and codegen_while condition body is_do state =
  let current_block = (Llvm.insertion_block builder) in
  let the_function = Llvm.block_parent current_block in

  let cond_block = Llvm.append_block context "whilecond" the_function in
  let start_block = Llvm.append_block context "while" the_function in
  let end_block = Llvm.append_block context "endwhile" the_function in

  let new_state = PrgmSt.set_loop_blocks state end_block cond_block in

  Llvm.position_at_end current_block builder;
  Llvm.build_br (if is_do then start_block else cond_block) builder |> ignore;

  Llvm.position_at_end cond_block builder;
  let cond_expr =
    match codegen_expr condition new_state with
    | v, TBool -> v
    | _ -> raise (CompileError "while loop condition must evaluate to bool")
  in
  Llvm.build_cond_br cond_expr start_block end_block builder |> ignore;

  Llvm.position_at_end start_block builder;
  codegen_statement body new_state |> ignore;
  Llvm.build_br cond_block builder |> ignore;

  Llvm.position_at_end end_block builder;


and codegen_function modifiers return_type name (params:(typ * string) list) body state =
  
  let the_function = codegen_function_decl modifiers return_type name params state in

  let entry_block = Llvm.append_block context "entry" the_function in
  Llvm.position_at_end entry_block builder;

  List.iteri (fun i (ty, param_name) ->
    let param = Llvm.param the_function i in
    Llvm.set_value_name param_name param;
    let alloca = entry_block_alloca the_function param_name ty state in
    Llvm.build_store param alloca builder |> ignore;
    PrgmSt.add_var state param_name (alloca, ty) |> ignore;
  ) params;

  let new_state = PrgmSt.push_stack state in 
  let new_state = PrgmSt.set_fun_type new_state return_type in
  let final_state = codegen_scope body new_state in
  (* List.iter (fun s -> codegen_statement s state return_type) body; *)

  (* this should actually just cause a compile error unless void *)
  if Llvm.block_terminator (Llvm.insertion_block builder) = None then
    if return_type = TVoid then Llvm.build_ret_void builder |> ignore else
      raise (CompileError "non-void function does not return");
  
  final_state

and codegen_function_decl modifiers return_type name (params:(typ * string) list) state = 
  let param_ts = Array.of_list (List.map (fun p -> fst p) params) in
  let mangled_name = mangle_method_name state.current_class_name name param_ts in 

  let param_types = Array.map (fun p -> to_lltype p state) param_ts in
  let func_type = Llvm.function_type (to_lltype return_type state) param_types in
  
  let the_function = Llvm.declare_function mangled_name func_type the_module in

  (* TODO: will have to check for existing declarations *)
  (if List.mem Static modifiers then
    PrgmSt.add_static state mangled_name (the_function, return_type) else
    PrgmSt.add_func state mangled_name (the_function, return_type)) |> ignore;
  the_function

