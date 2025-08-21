open Cg_statement
open Cg_expression
open Ast
open Util
open State

(* goofy file name *)

let codegen_methods (sl:statement list) (state:PrgmSt.t) = 
  List.iter (
    fun s -> match s with 
    | MethodDefinition _ | ConstructorDefinition _ -> codegen_statement s state |> ignore
    | _ -> ()
  ) sl

let collect_methods (sl:statement list) (state:PrgmSt.t) = 
  List.iter (
    fun s -> match s with
    | MethodDefinition(modifiers, t, name, params, _) -> codegen_function_decl modifiers t name params MangleDefault state |> ignore;
    | ConstructorDefinition(modfiers, name, params, _) -> codegen_function_decl modfiers TVoid name params MangleConstructor state |> ignore;
    | _ -> ()
    ) sl

let rec collect_fields (sl:statement list) (field_tys:Llvm.lltype list) (field_names: (string * typ) list) (initial_vals: Llvm.llvalue list) (state:PrgmSt.t) =
  match sl with
  | [] -> field_tys, field_names, initial_vals
  | x :: xs -> 
    match x with (* maybe have a hashtbl structure that holds struct names, fields with offsets, and default values *)
    | VarDefinition(_, t, n, initial_value) ->
      let initial_vals = 
        (match initial_value with 
        | Some v -> fst(codegen_expr v state) :: initial_vals
        | None -> get_default_value t state :: initial_vals (* FIXME: will give zeroinitializer if fields for struct field are not collected yet *)
        ) in
      collect_fields xs ((to_lltype t state) :: field_tys) ((n, t) :: field_names) initial_vals state
    | _ -> collect_fields xs field_tys field_names initial_vals state


let define_type (s:statement) (state:PrgmSt.t) =
  match s with
  | StructureDefinition(_, structure_type, name, body) ->
    (match structure_type with
    | Struct -> 
      let state = PrgmSt.set_class_name state name in
      let struct_data = PrgmSt.find_structdata state name in
      let struct_type = struct_data.llt in
      let elements = struct_data.elements in

      let field_tys, field_names, initial_vals = collect_fields body [] [] [] state in
      
      List.iteri (fun i (n, t) -> Hashtbl.replace elements n (i, t)) field_names;

      Llvm.struct_set_body struct_type (Array.of_list field_tys) false;

      (* re-add because its actually replacing it and a simple way to populate the array (or i could iter the list) *)
      PrgmSt.add_type state name { struct_data with initial_vals = Array.of_list initial_vals }

    | _ -> raise Unimplemented
    )
  | _ -> raise (FatalError "")

let declare_type (s:statement) (state:PrgmSt.t) =
  match s with
  | StructureDefinition(_, structure_type, name, _) ->
    (match structure_type with
    | Struct -> 
      (* some of this will probably happen for all of them *)
      let state = PrgmSt.set_class_name state name in
      let struct_type = Llvm.named_struct_type context name in
      
      PrgmSt.add_type state name { llt = struct_type; elements = Hashtbl.create 8; initial_vals = [||] }; state (* fill this later, in define_type *)
      
    | _ -> raise Unimplemented
    )
  | _ -> raise (FatalError "")

(* let collect_inners =  *)
