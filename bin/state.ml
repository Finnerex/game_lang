
open Ast

exception InvalidState
exception SymbolNotFound

(* modified from gisforgravity's amazing code in finnerex/language *)
module StLvl =
  struct
    (* map of functions, map of vars *) (* functions will probably end up not being string list statement list *)
    type t = (string, (string list * statement list)) Hashtbl.t * (string, (Llvm.llvalue * typ)) Hashtbl.t

    let add_var state name (value:(Llvm.llvalue * typ)) =
      let (function_map, var_map) = state in Hashtbl.replace var_map name value; (function_map, var_map)

    let rec add_vars state (var_list:(string * (Llvm.llvalue * typ)) list) =
      match var_list with
      | [] -> state
      | (n, v) :: ivl2 -> add_vars (add_var state n v) ivl2

    let add_func state name func =
      let (function_map, var_map) = state in Hashtbl.replace function_map name func; (function_map, var_map)

    let find_var_opt state name =
      let (_, vm) = state in Hashtbl.find_opt vm name

    let find_func_opt state name =
      let (fm, _) = state in Hashtbl.find_opt fm name
      
    let empty ():t = (Hashtbl.create 64, Hashtbl.create 32)
  end


module PrgmSt =
  struct
    type t = StLvl.t list
    
    let push_stack sl = (StLvl.empty ()) :: sl

    let pop_stack sl = 
      match sl with
      | [] -> raise InvalidState
      | _ :: new_sl -> new_sl

    let rec try_replace_var sl name value =
      match sl with
      | [] -> Error(Not_found)
      | s :: new_sl -> 
        (match StLvl.find_var_opt s name with
        | None -> 
          let sl_result = try_replace_var new_sl name value in
          (match sl_result with
          | Error(e) -> Error(e)
          | Ok(found_sl) -> Ok(s :: found_sl))

        | Some(_) -> 
          let mod_s = StLvl.add_var s name value in
          Ok(mod_s :: new_sl))

    let add_var sl name value =
      match try_replace_var sl name value with
      | Ok(new_p) -> new_p
      | Error(_) ->
        (match sl with
        | [] -> raise InvalidState
        | s :: new_sl -> let new_s = StLvl.add_var s name value in new_s :: new_sl)

    let add_vars sl (var_list:(string * (Llvm.llvalue * typ)) list) =
      (match sl with
      | [] -> raise InvalidState
      | s :: new_sl -> let new_s = StLvl.add_vars s var_list in new_s :: new_sl)

    let add_func sl name func =
      match sl with
      | [] -> raise InvalidState
      | s :: new_sl -> let new_s = StLvl.add_func s name func in new_s :: new_sl

    let rec find_var_opt sl name = 
      match sl with
      | [] -> None
      | s :: new_sl ->
        (match StLvl.find_var_opt s name with
        | Some(v) -> Some v
        | None -> find_var_opt new_sl name)

    let find_var sl name =
      match find_var_opt sl name with
      | Some(v) -> v
      | None -> raise Not_found
    
    let rec find_func sl name =
        match sl with
        | [] -> raise Not_found
        | s :: new_sl ->
          (match StLvl.find_func_opt s name with
          | Some(f) -> f
          | None -> find_func (new_sl) name)

    let empty = [StLvl.empty ()]
  end
