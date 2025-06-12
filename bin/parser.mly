%{
    open Ast

    (* exception BrokenParser *)
%}

%token <string> IDENT

// literals
%token <int> INT_LIT
%token <float> FLOAT_LIT
%token <bool> BOOL_LIT
%token <string> STRING_LIT

// types

%token TBOOL TINT TFLOAT TCHAR TSTRING TVOID TOBJECT

%token <Ast.modifier> MODIFIER 
%token <Ast.structureType> STRUCTURE
%token NEW

%token DOT

%token ARROW
%token SWITCH
%token PIPE

%token RETURN

// control flow
%token IF ELSE
%token FOR WHILE DO
%token BREAK CONTINUE

// operators
%token PLUS MINUS
%token TIMES DIV MOD

%token AND OR NOT

%token BOOL_EQUALS NOT_EQUALS
%token LESS GREATER LESS_EQ GREATER_EQ

%token ASSIGN_EQUALS

%token ASSIGN_PLUS ASSIGN_MINUS
%token ASSIGN_TIMES ASSIGN_DIV

%token INCREMENT DECREMENT

%token LPAREN RPAREN
%token LBRACE RBRACE
%token LBRACKET RBRACKET

%token COLON QUESTION_MARK

%token COMMA

%token ENDLINE
%token EOF


// precedence (lower first)
%nonassoc ARROW // i dont know if these should be low or high but i think low is right
%nonassoc PIPE
%right QUESTION_MARK COLON 
%left OR
%left AND
%left BOOL_EQUALS NOT_EQUALS
%left GREATER GREATER_EQ LESS LESS_EQ
%left PLUS MINUS 
%left TIMES DIV MOD
%nonassoc NOT
%nonassoc IF
%nonassoc ELSE
%nonassoc INCREMENT DECREMENT
%nonassoc VAR_PREC
%left DOT



%start main
%type <Ast.statement list> main
// %type <Ast.expression> main

%%

main:
// using directives, also i guess preprocessor directives exist
// | list(structure_definition) EOF
//     { $1 }
| list(structure_definition) EOF { $1 }
;


structure_definition: // returns statement
| list(MODIFIER) STRUCTURE IDENT LBRACE list(classlevel_definition) RBRACE
    { StructureDefinition($1, $2, $3, $5) }
;

primitive_type: // kinda a bad system
| TBOOL     { TBool }
| TINT      { TInt }
| TFLOAT    { TFloat }
| TCHAR     { TChar }
| TSTRING   { TString }
| TVOID     { TVoid } // idk if this is considered a prim
| TOBJECT   { TObject }
;

typ:
| primitive_type    
    { $1 }
| primitive_type TIMES
    { TPointer($1) }
| typ LBRACKET RBRACKET 
    { TArray($1) }
| IDENT
    { TCustom($1) }
;


classlevel_definition:
| list(MODIFIER) typ IDENT ASSIGN_EQUALS expression ENDLINE
    { VarDefinition($1, $2, $3, (Some $5)) }

| list(MODIFIER) typ IDENT ASSIGN_EQUALS array_literal ENDLINE // maybe this should actually be different
    { VarDefinition($1, $2, $3, (Some $5)) }

| list(MODIFIER) typ IDENT ENDLINE
    { VarDefinition($1, $2, $3, None) }

| list(MODIFIER) typ IDENT LPAREN define_params RPAREN LBRACE list(statement) RBRACE 
    { MethodDefinition($1, $2, $3, $5, $8) }

| list(MODIFIER) typ IDENT LPAREN define_params RPAREN ARROW expression ENDLINE
    { MethodDefinition($1, $2, $3, $5, [Return (Some $8)]) }

| list(MODIFIER) IDENT LPAREN define_params RPAREN LBRACE list(statement) RBRACE 
    { ConstructorDefinition($1, $2, $4, $7) }

| structure_definition
    { $1 }
;


function_call:
| var LPAREN input_params RPAREN // this is definitely a little strange
    { FunctionCall($1, $3) }
// | IDENT LPAREN input_params RPAREN
//     { FunctionCall($1, $3) }
// | expression DOT IDENT LPAREN input_params RPAREN
//     { MethodCall($1, $3, $5) }
| primitive_type DOT IDENT LPAREN input_params RPAREN
    { PrimitiveStaticMethodCall($1, $3, $5) }
;


array_literal:
| LBRACE separated_list(COMMA, expression) RBRACE
    { Array($2) }
;

%inline input_params:
| separated_list(COMMA, expression) { $1 }
;

%inline define_params:
| separated_list(COMMA, typ IDENT {($1, $2)}) { $1 }
;


incomplete_statement:
| typ IDENT ASSIGN_EQUALS expression
    { VarDefinition([], $1, $2, (Some $4)) } // maybe this should be different

| typ IDENT ASSIGN_EQUALS array_literal // maybe this should actually be different
    { VarDefinition([], $1, $2, (Some $4)) }

| typ IDENT 
    { VarDefinition([], $1, $2, None) }

| lvalue ASSIGN_EQUALS expression
    { Assign($1, $3) }


| lvalue ASSIGN_PLUS expression
    { Assign($1, Add(Access $1, $3))}
| lvalue ASSIGN_MINUS expression
    { Assign($1, Sub(Access $1, $3))}
| lvalue ASSIGN_TIMES expression
    { Assign($1, Mul(Access $1, $3))}
| lvalue ASSIGN_DIV expression
    { Assign($1, Div(Access $1, $3))}

| incr_decr
    { ExpressionStatement($1) }

| function_call
    { ExpressionStatement($1) }

;


statement: // returns statement
| LBRACE list(statement) RBRACE
    { Scope($2) }
| incomplete_statement ENDLINE
    { $1 }

| RETURN expression? ENDLINE
    { Return($2) }

// if 
| IF LPAREN expression RPAREN statement %prec IF
    { If($3, $5, None) }
| IF LPAREN expression RPAREN statement ELSE statement
    { If($3, $5, (Some $7)) }

// maybe expression should be pattern not exactly sure how that works (can match on a non constant and also some other syntaxes happen)
| SWITCH LPAREN expression RPAREN nonempty_list(pair(delimited(PIPE, expression, ARROW), statement)) 
    { Switch($3, $5) }

// loop
| FOR LPAREN incomplete_statement ENDLINE expression ENDLINE incomplete_statement RPAREN statement
    { For($3, $5, $7, $9) }
| WHILE LPAREN expression RPAREN statement
    { While($3, $5)}
| DO statement WHILE LPAREN expression RPAREN ENDLINE
    { DoWhile($5, $2)}

| BREAK ENDLINE
    { Break }
| CONTINUE ENDLINE
    { Continue }
;

// TODO restructure this
lvalue:
| IDENT { Var($1) }
| lvalue DOT IDENT { Field(Access $1, $3) } /* i think this is what i want */

var:
| lvalue { $1 } %prec VAR_PREC
| expression DOT IDENT { Field($1, $3) }
;


expression: // returns expression
| LPAREN expression RPAREN
    { $2 }

| var 
    { Access $1 }

| literal
    { $1 }

| incr_decr
    { $1 }

| math_expression
    { $1 }

| function_call
    { $1 }

| MINUS expression
    { Sub((Int 0), $2) } /* TODO: sugar this into a negation i think bc theres an instruction for that */

| NEW typ LPAREN input_params RPAREN // idk if typ or ident
    { ConstructorCall($2, $4) }

| primitive_type DOT IDENT // this shit goofy (and maybe should be var)
    { PrimitiveStaticField($1, $3) }

// ternary
| expression QUESTION_MARK expression COLON expression
    { Ternary($1, $3, $5) }

| SWITCH LPAREN expression RPAREN nonempty_list(pair(delimited(PIPE, expression, ARROW), expression))
    { SwitchExpr($3, $5) }

;

math_expression:
| expression PLUS expression
    { Add($1, $3) }
| expression MINUS expression
    { Sub($1, $3) }
| expression TIMES expression
    { Mul($1, $3) }
| expression DIV expression
    { Div($1, $3) }
| expression MOD expression
    { Mod($1, $3) }

| expression AND expression
    { And($1, $3) }
| expression OR expression
    { Or($1, $3) }
| NOT expression
    { Not($2) }
| expression BOOL_EQUALS expression
    { Equals($1, $3) }
| expression NOT_EQUALS expression
    { NotEquals($1, $3) }

| expression LESS_EQ expression
    { LessEq($1, $3) }
| expression LESS expression
    { Less($1, $3) }
| expression GREATER_EQ expression
    { GreaterEq($1, $3) }
| expression GREATER expression
    { Greater($1, $3) }

;

literal:
| INT_LIT
    { Int($1) }

| FLOAT_LIT
    { Float($1) }

| BOOL_LIT
    { Bool($1) }

| STRING_LIT
    { String($1) }

;

incr_decr:
| lvalue INCREMENT
    { PostIncrement($1) }
| INCREMENT lvalue // this problem does not happen if increment expression
    { PreIncrement($2) }
| lvalue DECREMENT
    { PostDecrement($1) }
| DECREMENT lvalue
    { PreDecrement($2) }

;

