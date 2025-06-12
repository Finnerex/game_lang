open Codegen
open Ast
open Util
open State

(* goofy file name *)

let codegen_methods (sl:statement list) (state:PrgmSt.t) = 
  List.iter (
    fun s -> match s with 
    | MethodDefinition _ -> codegen_statement s state |> ignore
    | _ -> ()
  ) sl

let collect_methods (sl:statement list) (state:PrgmSt.t) = 
  List.iter (
    fun s -> match s with
    | MethodDefinition (modifiers, t, name, params, _) -> codegen_function_decl modifiers t name params state |> ignore;
    | _ -> ()
    ) sl

let rec collect_fields (sl:statement list) (field_tys:Llvm.lltype list) (field_names: (string * typ) list) (state:PrgmSt.t) =
  match sl with
  | [] -> field_tys, field_names
  | x :: xs -> 
    match x with (* maybe have a hashtbl structure that holds struct names, fields with offsets, and default values *)
    | VarDefinition(_, t, n, _) ->
      collect_fields xs (to_lltype t state :: field_tys) ((n, t) :: field_names) state
    | _ -> collect_fields xs field_tys field_names state
      
let define_type (s:statement) (state:PrgmSt.t) =
  match s with
  | StructureDefinition(_, structure_type, name, body) ->
    (match structure_type with
    | Struct -> (* some of this will probably happen for all of them *)
      (* create the struct type and make method decls *)
      let state = PrgmSt.set_class_name state name in
      let struct_type = Llvm.named_struct_type context name in
      let field_tys, field_names = collect_fields body [] [] state in

      let field_idxs = Hashtbl.create 8 in
      List.iteri (fun i (n, t) -> Hashtbl.replace field_idxs n (i, t)) field_names;

      Llvm.struct_set_body struct_type (Array.of_list field_tys) false;

      PrgmSt.add_type state name { llt = struct_type; elements = field_idxs }; state
      
    | _ -> raise Unimplemented
    )
  | _ -> raise (FatalError "")

(* let collect_inners =  *)
