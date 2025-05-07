{
    open Parser
    let string_buf = Buffer.create 256
    exception SyntaxError of string
}

let blank = [' ' '\t' '\n' '\r']
let symbol = ['A'-'Z' 'a'-'z']
let digit = ['0'-'9']

let ident = '_'* ['A'-'Z' 'a'-'z'] ['A'-'Z' 'a'-'z' '_' '0'-'9']*


rule token = parse
| blank+        { token lexbuf }
| digit* '.' digit+ { FLOAT_LIT (float_of_string(Lexing.lexeme lexbuf))}
| digit+        { INT_LIT (int_of_string(Lexing.lexeme lexbuf))}

| "//"          { line_comment lexbuf |> token }
| "/*"          { block_comment lexbuf |> token }

| '"'           { Buffer.clear string_buf; str lexbuf; STRING_LIT (Buffer.contents string_buf) }

| "public"      { MODIFIER (Public) }
| "private"     { MODIFIER (Private) }
| "protected"   { MODIFIER (Protected) }

| "extern"      { MODIFIER (Extern) }

| "class"       { CLASS }
| "new"         { NEW }

| '.'           { DOT }

| "->"          { ARROW } (* to have pointers or to not *)

| "return"      { RETURN }

| "bool"        { TBOOL }
| "int"         { TINT }
| "float"       { TFLOAT }
| "string"      { TSTRING }
| "void"        { TVOID }
| "object"      { TOBJECT }

| "if"          { IF }
| "else"        { ELSE }
| "for"         { FOR }
| "while"       { WHILE }
| "do"          { DO }
| "break"       { BREAK }
| "continue"    { CONTINUE }

| "++"          { INCREMENT }
| "--"          { DECREMENT }

| '+'           { PLUS }
| '/'           { DIV }
| '-'           { MINUS }
| '*'           { TIMES }

| '='           { ASSIGN_EQUALS }
| "+="          { ASSIGN_PLUS }
| "-="          { ASSIGN_MINUS }
| "*="          { ASSIGN_TIMES }
| "/="          { ASSIGN_DIV }

| "true"        { BOOL_LIT true }
| "false"       { BOOL_LIT false }

| "=="          { BOOL_EQUALS }
| "!="          { NOT_EQUALS }
| "&&"          { AND }
| "||"          { OR }
| '!'           { NOT }

| "<="          { LESS_EQ }
| '<'           { LESS }
| ">="          { GREATER_EQ }
| '>'           { GREATER }

| ':'           { COLON }
| '?'           { QUESTION_MARK }

| '('           { LPAREN }
| ')'           { RPAREN }
| '{'           { LBRACE }
| '}'           { RBRACE }
| '['           { LBRACKET }
| ']'           { RBRACKET }

| ','           { COMMA }

| ';'           { ENDLINE }

| ident         { IDENT (Lexing.lexeme lexbuf) }

| eof           { EOF }

and str = parse
| '"'       { () }
| eof       { raise (SyntaxError("String is not terminated")) }
| _ as c    { Buffer.add_char string_buf c; str lexbuf }
(* add backslash escapes *)

and line_comment = parse
| '\n'  { lexbuf }
| eof   { lexbuf }
| _     { line_comment lexbuf }

and block_comment = parse
| "*/"  { lexbuf }
| eof   { lexbuf }
| _     { block_comment lexbuf }