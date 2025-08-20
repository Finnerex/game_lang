
open Ast

exception InvalidState
exception SymbolNotFound of string

(* modified from gisforgravity's amazing code in github.com/finnerex/language *)
module StLvl = struct
  type t =
  {
    methods: (string, (Llvm.llvalue * typ)) Hashtbl.t;
    static_methods: (string, (Llvm.llvalue * typ)) Hashtbl.t;
    vars: (string, (Llvm.llvalue * typ)) Hashtbl.t
  }

  let add_var state name (value:Llvm.llvalue * typ) = Hashtbl.replace state.vars name value; state
  let add_func state name func = Hashtbl.replace state.methods name func; state
  let add_static state name m = Hashtbl.replace state.static_methods name m; state

  let find_var_opt state name = Hashtbl.find_opt state.vars name
  let find_func_opt state name = Hashtbl.find_opt state.methods name
  let find_static_opt state name = Hashtbl.find_opt state.static_methods name
    
  let empty ():t = { vars = Hashtbl.create 16; methods = Hashtbl.create 8; static_methods = Hashtbl.create 8; }
end

(* i should only have to return the state if i want a parent function to know about a push or a pop *)
module PrgmSt = struct
  type structdata = { llt: Llvm.lltype; elements: (string, int * typ) Hashtbl.t } (* elements are name -> index, type *)

  type t =
  {
    scopes: StLvl.t list;

    loop_break_block: Llvm.llbasicblock option;
    loop_cont_block: Llvm.llbasicblock option;

    function_ret_type: typ;
    current_class_name: string;

    types: (string, structdata) Hashtbl.t (* custom type names and their lltypes/elements *)
  }
  
  
  let push_stack sl :t = { sl with scopes = (StLvl.empty ()) :: sl.scopes }

  let pop_stack sl = { sl with scopes =
    match sl.scopes with
    | [] -> raise InvalidState
    | _ :: new_sl -> new_sl
    }
    

  let rec try_replace_var sl name value =
    match sl.scopes with
    | [] -> Error(SymbolNotFound name)
    | s :: new_sl -> 
      (match StLvl.find_var_opt s name with
      | None -> 
        let sl_result = try_replace_var {sl with scopes = new_sl} name value in
        (match sl_result with
        | Error(e) -> Error(e)
        | Ok(found_sl) -> Ok(s :: found_sl))

      | Some(_) -> 
        let mod_s = StLvl.add_var s name value in
        Ok(mod_s :: new_sl))

  let add_var sl name value =  { sl with scopes = 
    match try_replace_var sl name value with
    | Ok(new_p) -> new_p
    | Error(_) ->
      (match sl.scopes with
      | [] -> raise InvalidState
      | s :: new_sl -> let new_s = StLvl.add_var s name value in new_s :: new_sl)
  }

  let add_func sl name func = { sl with scopes = 
    match sl.scopes with
    | [] -> raise InvalidState
    | s :: new_sl -> let new_s = StLvl.add_func s name func in new_s :: new_sl
  }

  let add_static sl name func = { sl with scopes = 
    match sl.scopes with
    | [] -> raise InvalidState
    | s :: new_sl -> let new_s = StLvl.add_static s name func in new_s :: new_sl
  }

  let rec find_opt sl name ~f =
    match sl with 
    | [] -> None
    | s :: new_sl -> 
      (match f s name with
      | Some a -> Some a
      | None -> find_opt new_sl name ~f)

  let find sl name ~f =
    match find_opt sl name ~f with
    | Some a -> a
    | None -> raise (SymbolNotFound name)
  

  let find_var_opt sl name = find_opt sl.scopes name ~f:StLvl.find_var_opt
  let find_var sl name = find sl.scopes name ~f:StLvl.find_var_opt
  
  let find_func_opt sl name = find_opt sl.scopes name ~f:StLvl.find_func_opt
  let find_func sl name = find sl.scopes name ~f:StLvl.find_func_opt

  let find_static_opt sl name = find_opt sl.scopes name ~f:StLvl.find_static_opt
  let find_static sl name = find sl.scopes name ~f:StLvl.find_static_opt

  let set_loop_blocks st b c = { st with loop_break_block = Some b; loop_cont_block = Some c }

  let set_fun_type st ty = { st with function_ret_type = ty }

  let set_class_name st n = { st with current_class_name = n }

  let get_loop_break st = match st.loop_break_block with Some b -> b | None -> raise InvalidState
  let get_loop_cont st = match st.loop_cont_block with Some b -> b | None -> raise InvalidState

  let has_type st name = Hashtbl.mem st.types name
  let find_type st name = (Hashtbl.find st.types name).llt
  let find_field st tyname fname = Hashtbl.find (Hashtbl.find st.types tyname).elements fname
  let add_type st name ty = Hashtbl.replace st.types name ty

  let empty =
  {
    scopes = [StLvl.empty ()];
    loop_break_block = None;
    loop_cont_block = None;
    function_ret_type = TVoid;
    current_class_name = "default";
    types = Hashtbl.create 8;
  }
end
