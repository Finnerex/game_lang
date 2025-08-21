
open Ast
open State
open Util

[@@@ocaml.warning "-26-27" ] (* suppress unused during development bc its annoying *)

let rec codegen_expr (e:expression) (state:PrgmSt.t) : Llvm.llvalue * typ =
  match e with
  | Bool(b)   -> Llvm.const_int llvm_bool_type (if b then 1 else 0), TBool
  | Int(x)    -> Llvm.const_int llvm_i32_type x, TInt
  | Float(x)  -> Llvm.const_float llvm_float_type x, TFloat
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
  | Access(v) ->
    let (value, t), n = (match v with 
    | Var name -> get_var_or_field name state, name
    | Field (Access obj, fieldname) -> get_element_ptr obj fieldname state, fieldname
    | _ -> raise Unimplemented) in 
    Llvm.build_load (to_lltype t state) value n builder, t

  | FunctionCall(Var name, args) -> (* function (no dot) *) (* todo make work with instance *)
    let arg_exprs, arg_ts = args |> Array.of_list |> Array.map (fun a -> codegen_expr a state) |> Array.split in

    let mangled_name = mangle_method_name state.current_class_name name arg_ts MangleDefault in (* use enclosing class as the class name *)
    let (the_function, return_type), arg_exprs, arg_ts = 
    match PrgmSt.find_static_opt state mangled_name with
    | Some(f, t) -> (f, t), arg_exprs, arg_ts
    | None -> (* non-static *)
      let mangled_name = mangle_method_name state.current_class_name name arg_ts MangleDefault in
      let arg_exprs, arg_ts = Array.append [|fst (PrgmSt.find_var state "this")|] arg_exprs, Array.append [| TPointer (TCustom state.current_class_name) |] arg_ts in
      PrgmSt.find_func state mangled_name, arg_exprs, arg_ts
    in 
    
    codegen_call the_function arg_exprs arg_ts return_type state, return_type
      
  | FunctionCall(Field (x, name), args) -> (* method with dot *)
    let expr, t, args = (match x with 
      | Access (Var v) ->
        if PrgmSt.has_type state v then None, TCustom v, args else (* static *)
        let expr, t = get_var_or_field v state in Some expr, t, args (* isnt static *)
      | _ -> let expr, t = codegen_expr x state in Some expr, t, args (* not static, not called on variable (called on expression) *)
    ) in

    let arg_exprs, arg_ts = args |> Array.of_list |> Array.map (fun a -> codegen_expr a state) |> Array.split in
    let mangled_name = (match t with
      | TCustom s_name -> mangle_method_name s_name name arg_ts MangleDefault
      | _ -> raise (FatalError "method called on non-custom type") (* or maybe things can happen *)) in

    (* "expr" should be the first of the args if not static *)
    (* im sortof checking if its static twice which is not so good *)
    let (the_function, return_type), arg_exprs, arg_ts = match expr with 
    | Some this_expr -> PrgmSt.find_func state mangled_name, Array.append [| this_expr |] arg_exprs, Array.append [| t |] arg_ts
    | None -> PrgmSt.find_static state mangled_name, arg_exprs, arg_ts in

    codegen_call the_function arg_exprs arg_ts return_type state, return_type
    
  | ConstructorCall(t, args) ->
    let struct_data = PrgmSt.find_structdata state (match t with TCustom(x) -> x | _ -> raise Unimplemented) in
    let struct_value = Llvm.const_named_struct struct_data.llt struct_data.initial_vals in (* would output a ptr to allocated object if this is a class constructor call not struc *)
    (* Llvm.build_call a bunch of stuff from the abocve thing should be in its own function that can be called from here; *)
    let arg_exprs, arg_ts = args |> Array.of_list |> Array.map (fun a -> codegen_expr a state) |> Array.split in (* TODO: STOP REPEATING THIS *)
    let mangled_name = (match t with
      | TCustom s_name -> mangle_method_name s_name s_name arg_ts MangleConstructor
      | _ -> raise (FatalError "constructor called on non-custom type") (* this is bad because you can do things like new string() i think *)
      ) in
    let the_function, return_type = PrgmSt.find_func state mangled_name in (* TODO: If you cant find it dont make a call *)
    codegen_call the_function arg_exprs arg_ts return_type state |> ignore;

    struct_value, t (* TODO: init correctly and actually call the constructor *)

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

and codegen_ternary condition then_expr else_expr state =
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

and codegen_call the_function arg_exprs arg_ts return_type state = (* more could be done here *)
  let func_type = arg_ts |> Array.map (fun a -> to_lltype a state) |> Llvm.function_type (to_lltype return_type state) in
  let tmp_name = if return_type = TVoid then "" else "calltmp" in
  Llvm.build_call func_type the_function arg_exprs tmp_name builder

