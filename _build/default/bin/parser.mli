
(* The type of tokens. *)

type token = 
  | WHILE
  | TVOID
  | TSTRING
  | TOBJECT
  | TINT
  | TIMES
  | TFLOAT
  | TCHAR
  | TBOOL
  | SWITCH
  | STRUCTURE of (Ast.structureType)
  | STRING_LIT of (string)
  | RPAREN
  | RETURN
  | RBRACKET
  | RBRACE
  | QUESTION_MARK
  | PLUS
  | PIPE
  | OR
  | NOT_EQUALS
  | NOT
  | NEW
  | MODIFIER of (Ast.modifier)
  | MOD
  | MINUS
  | LPAREN
  | LESS_EQ
  | LESS
  | LBRACKET
  | LBRACE
  | INT_LIT of (int)
  | INCREMENT
  | IF
  | IDENT of (string)
  | GREATER_EQ
  | GREATER
  | FOR
  | FLOAT_LIT of (float)
  | EOF
  | ENDLINE
  | ELSE
  | DOT
  | DO
  | DIV
  | DECREMENT
  | CONTINUE
  | COMMA
  | COLON
  | BREAK
  | BOOL_LIT of (bool)
  | BOOL_EQUALS
  | ASSIGN_TIMES
  | ASSIGN_PLUS
  | ASSIGN_MINUS
  | ASSIGN_EQUALS
  | ASSIGN_DIV
  | ARROW
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.statement list)
