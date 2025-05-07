
type modifier =
| Public
| Private
| Protected
| Extern

type typ = 
| TBool
| TInt
| TFloat
| TChar
| TString
| TVoid
| TObject
| TPointer of typ
| TArray of typ
| TCustom of string

type expression =
| Bool of bool
| Int of int
| Float of float
| String of string
| Array of expression list

| Access of var
(* | Field of expression * string (* still have to determine if expression is a type name (Var i guess) *) *)
| PrimitiveStaticField of typ * string

| Ternary of expression * expression * expression

| FunctionCall of string * (expression list) (* idk if these should actually be handled differently i could have expression option idk if that makes sense *)
| MethodCall of expression * string * (expression list)  (* again, check if expression is type name *)
| ConstructorCall of typ * (expression list)
| PrimitiveStaticMethodCall of typ * string * (expression list)

| Add of expression * expression
| Sub of expression * expression
| Mul of expression * expression
| Div of expression * expression

| PreIncrement of var
| PostIncrement of var
| PreDecrement of var
| PostDecrement of var

| And of expression * expression
| Or of expression * expression
| Not of expression
| Equals of expression * expression
| NotEquals of expression * expression

| Less of expression * expression
| LessEq of expression * expression
| Greater of expression * expression
| GreaterEq of expression * expression

and var =
| Var of string
| Field of expression * string (* the expression will have to boil down to an object *)


type statement = 
| Scope of statement list

| ExpressionStatement of expression (* for throwing things away (function calls mainly but maybe other things) *)

(* modifiers, name, methods and fields (maybe should be separate), maybe make the kind of statement more specific idk *)
| ClassDefinition of (modifier list) * string * (statement list)
(* modifiers, type, name, params, body *)
| MethodDefinition of (modifier list) * typ * string * ((typ * string) list) * (statement list)
| ConstructorDefinition of (modifier list) * string * ((typ * string) list) * (statement list)

| Return of expression option

| VarDefinition of (modifier list) * typ * string * (expression option)
| Assign of var * expression

| If of expression * statement * (statement option)

| For of statement * expression * statement * statement
| While of expression * statement
| DoWhile of expression * statement (* maybe this doesnt need to happen *)

| Break
| Continue

