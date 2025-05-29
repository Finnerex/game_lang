open Ast

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

let entry_block_alloca func name typ =
  func |> Llvm.entry_block |> Llvm.instr_begin |> Llvm.builder_at context |> (* she line on my pipe til i ocam *)
  Llvm.build_alloca (to_lltype typ) name

let rec string_of_typ = function 
| TVoid -> "void"
| TBool -> "bool"
| TInt -> "int"
| TFloat -> "float"
| TPointer t -> (string_of_typ t) ^ "_ptr"
| TCustom name -> "custom_" ^ name
| _ -> raise Unimplemented

(* maybe should take in lltype instead of typ *)
let mangle_method_name (* (ret_type:typ) *) structure_name method_name (param_types:typ array) = 
    if method_name = "main" then "main" else
    let params_str = Array.fold_left (fun last t -> last ^ "-" ^ string_of_typ t) "" param_types in
    (* string_of_typ ret_type ^ "-1" ^ *) structure_name ^ "-1n-" ^ method_name ^ "-2p" ^ params_str (* i dont know what im doing *)