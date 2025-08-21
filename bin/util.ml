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
let llvm_i32_type = Llvm.i32_type context
let llvm_bool_type = Llvm.i1_type context
let llvm_float_type = Llvm.float_type context
let llvm_void_type = Llvm.void_type context
let llvm_ptr_type = Llvm.pointer_type context

let to_lltype t state =
  match t with 
  | TVoid -> llvm_void_type
  | TBool -> llvm_bool_type
  | TInt -> llvm_i32_type
  | TFloat -> llvm_float_type
  | TPointer _ -> llvm_ptr_type
  | TCustom n -> PrgmSt.find_type state n
  | _ -> raise (FatalError "no lltype exists for this type")

(* a better promotion system will have to be devised *)
let promote_to_float a b = (Llvm.build_sitofp a llvm_float_type "tmpfloat" builder, Llvm.build_sitofp b llvm_float_type "tmpfloat" builder)

let get_default_value t state =
  let llt = (to_lltype t state) in
  match t with 
  | TCustom n -> let initial_vals = (PrgmSt.find_structdata state n).initial_vals in Llvm.const_named_struct llt initial_vals
  | _ -> Llvm.const_null llt

let rec string_of_typ = function 
| TVoid -> "void"
| TBool -> "bool"
| TInt -> "int"
| TFloat -> "float"
| TPointer t -> (string_of_typ t) ^ "_p"
| TCustom name -> "c_" ^ name
| _ -> raise Unimplemented


(* if this is a pointer then return it, otherwise, create the allocation and store *)
let entry_block_alloca func name typ state : Llvm.llvalue = 
  (* let _ = if name = "this" then raise (CompileError (name ^ " has type " ^ string_of_typ typ)) else () in *)
  
    let lltype = to_lltype typ state in 
    (func |> Llvm.entry_block |> Llvm.instr_begin |> Llvm.builder_at context |> Llvm.build_alloca lltype name) (* she line on my pipe til i ocam *)
    

let alloca_param func name typ param state = 
  match typ with
  | TPointer _ -> param
  | _ ->
    let alloca = entry_block_alloca func name typ state in
    Llvm.build_store param alloca builder |> ignore; alloca (* i think this alloca store thing only needs to be done if you want to modify the param *)
  

(* maybe should take in lltype instead of typ *)
type mangle_type = MangleDefault | NoMangle | MangleConstructor

let mangle_method_name structure_name method_name (param_types:typ array) (mangle_type:mangle_type) = 
  let params_str = if param_types <> [||] then Array.fold_left (fun last t -> last ^ "-" ^ string_of_typ t) "-p" param_types else "" in
  match mangle_type with
  | NoMangle -> method_name
  | MangleDefault -> structure_name ^ "-n-" ^ method_name ^ params_str (* i dont know what im doing *)
  | MangleConstructor -> structure_name ^ "-constructor" ^ params_str 

let rec get_element_ptr obj fieldname state = 
  let v, t = match obj with 
    | Var n -> (* PrgmSt.find_var *) if fieldname = "this" then raise Not_found else get_var_or_field n state (* check if looking for "this" because that would cause this.this.this... *)
    | Field (Access other, fname) -> get_element_ptr other fname state (* TODO, test if this work bc idk *)
    | _ -> raise Unimplemented (* again, expression access comes later bc i dont feel like it. might have to be mutually recursive with the other thing *)
  in
  let structName = (match t with | TCustom n -> n | TPointer TCustom n -> n | _ -> raise Unimplemented) in
  let idx, ftype = (PrgmSt.find_field state structName fieldname) in
  Llvm.build_struct_gep (PrgmSt.find_type state structName) v idx (structName ^ fieldname) builder, ftype

and get_var_or_field name state = 
  match PrgmSt.find_var_opt state name with
  | Some v -> v
  | None -> get_element_ptr (Var "this") name state


    
