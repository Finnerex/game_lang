
[@@@ocaml.warning "-33"] (* suppress unused open for testing *)

open Codegen
open State 

let () =

  let input_channel = if Array.length(Sys.argv) > 1 then open_in Sys.argv.(1) else stdin in

  let lexbuf = Lexing.from_channel input_channel in

  try
   let result = Parser.main Lexer.token lexbuf in

    let initial_state = PrgmSt.push_stack PrgmSt.empty in

   let _ = codegen_scope result initial_state TVoid in
   (* let _ = codegen_expr result PrgmSt.empty in *)
   let oc = if Array.length(Sys.argv) > 2 then open_out Sys.argv.(2) else stdout in
   Printf.fprintf oc "\n%s\n\n" (Llvm.string_of_llmodule the_module);
   close_out oc

  with
  | Parser.Error ->
    let pos = lexbuf.lex_curr_p in
    Printf.printf "Syntax error at line %d, column %d\n"
      pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)