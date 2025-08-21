
[@@@ocaml.warning "-33"] (* suppress unused open for testing *)

open Cg_statement
open State
open Util
open Ast
open Collect

let get_main_ast n = ExpressionStatement(FunctionCall(Field (Access (Var n), "Main"), []))
(* generate a function called "main" that calls all of the Main methods. right now this requires all strucutres to have a Main *)
let codegen_main (class_names:string list) state =
  let calls = List.map (fun s -> get_main_ast s) class_names in
  let body = calls @ [Return (Some (Int 0))] in
  codegen_function [Static] TInt "main" [] body NoMangle state


let () =

  Printexc.record_backtrace true |> ignore;

  let input_channel = if Array.length(Sys.argv) > 1 then open_in Sys.argv.(1) else stdin in

  let lexbuf = Lexing.from_channel input_channel in

  try
    let result = Parser.main Lexer.token lexbuf in

    (* let state = PrgmSt.empty in *)
    
    (* List.iter (fun c -> 
      let state = define_type c state in
      let body = match c with StructureDefinition(_, _, _, sl) -> sl | _ -> raise Unimplemented in
      collect_methods body state;
      codegen_methods body state;
    ) result; *)

    (* let state = define_types result PrgmSt.empty in *)

    let state = PrgmSt.empty in
    List.iter (fun c -> declare_type c state |> ignore; ) result;
    List.iter (fun c -> define_type c state |> ignore; ) result;

    List.iter (fun c -> 
      let body, name = match c with StructureDefinition(_, _, n, sl) -> sl, n | _ -> raise Unimplemented in
      collect_methods body {state with current_class_name = name };
    ) result;

    List.iter (fun c -> 
      let body, name = match c with StructureDefinition(_, _, n, sl) -> sl, n | _ -> raise Unimplemented in
      codegen_methods body {state with current_class_name = name };
    ) result;

    codegen_main (state.types |> Hashtbl.to_seq_keys |> List.of_seq) state |> ignore;


    let oc = if Array.length(Sys.argv) > 2 then open_out Sys.argv.(2) else stdout in
    Printf.fprintf oc "\n%s\n\n" (Llvm.string_of_llmodule the_module);
    close_out oc

  with
  | Parser.Error ->
    let pos = lexbuf.lex_curr_p in
    Printf.printf "Syntax error at line %d, column %d\n"
      pos.pos_lnum (pos.pos_cnum - pos.pos_bol)