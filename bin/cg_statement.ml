
open Ast
open State
open Util
open Cg_expression

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
        | None -> get_default_value t state) in Llvm.build_store v alloca builder |> ignore;
        state

  (* i could likely combine these two *)
  | Assign(Var(name), e) ->
    let (var_value, var_type) = get_var_or_field name state in 
    let (expr_value, expr_type) = codegen_expr e state in
    if var_type <> expr_type then raise (CompileError "variable type does not match assigned expression's type") else (* TODO: deal with promotion *)
    Llvm.build_store expr_value var_value builder |> ignore; state

  | Assign(Field (Access obj, fieldname), e) ->
    let var_value, var_type = get_element_ptr obj fieldname state in
    let expr_value, expr_type = codegen_expr e state in
    if var_type <> expr_type then raise (CompileError "variable type does not match assigned expression's type") else (* TODO: deal with promotion *)
    Llvm.build_store expr_value var_value builder |> ignore; state

  | MethodDefinition(modifiers, t, name, params, body) -> codegen_function modifiers t name params body MangleDefault state
  | ConstructorDefinition(modifiers, tname, params, body) -> codegen_function modifiers TVoid tname params body MangleConstructor state

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


and codegen_function modifiers return_type name (params:(typ * string) list) body mangle_type state =
  
  let the_function = codegen_function_decl modifiers return_type name params mangle_type state in
  let params = if List.mem Static modifiers then params else ((TPointer (TCustom state.current_class_name)), "this") :: params in

  let entry_block = Llvm.append_block context "entry" the_function in
  Llvm.position_at_end entry_block builder;

  List.iteri (fun i (ty, param_name) ->
    let param = Llvm.param the_function i in
    Llvm.set_value_name param_name param;

    let var = alloca_param the_function param_name ty param state in
    PrgmSt.add_var state param_name (var, ty) |> ignore;

  ) params;

  let new_state = PrgmSt.push_stack state in 
  let new_state = PrgmSt.set_fun_type new_state return_type in
  let final_state = codegen_scope body new_state in
  (* List.iter (fun s -> codegen_statement s state return_type) body; *)

  (* this should actually just cause a compile error unless void *)
  (* lmao this allows for a void function to return a void thing (like void func call) (caught as an error by llc) *)
  if Llvm.block_terminator (Llvm.insertion_block builder) = None then
    if return_type = TVoid then Llvm.build_ret_void builder |> ignore else
      raise (CompileError "non-void function does not return");
  
  final_state

and codegen_function_decl modifiers return_type name (params:(typ * string) list) mangle_type state = 
  let param_ts = Array.of_list (List.map (fun p -> fst p) params) in
  let mangled_name = mangle_method_name state.current_class_name name param_ts mangle_type in 

  (* let param_ts = if List.mem Static modifiers then param_ts else (Array.append [| TCustom state.current_class_name |] param_ts) in *)

  let param_types = Array.map (fun p -> to_lltype p state) param_ts in
  let param_types = if List.mem Static modifiers then param_types else Array.append [| llvm_ptr_type |] param_types in

  let func_type = Llvm.function_type (to_lltype return_type state) param_types in
  
  let the_function = Llvm.declare_function mangled_name func_type the_module in

  (* TODO: will have to check for existing declarations *)
  (if List.mem Static modifiers then
    PrgmSt.add_static state mangled_name (the_function, return_type) else
    PrgmSt.add_func state mangled_name (the_function, return_type)) |> ignore;
  the_function
