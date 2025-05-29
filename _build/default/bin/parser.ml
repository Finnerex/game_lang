
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | STRUCTURE of (
# 20 "bin/parser.mly"
       (Ast.structureType)
# 25 "bin/parser.ml"
  )
    | STRING_LIT of (
# 13 "bin/parser.mly"
       (string)
# 30 "bin/parser.ml"
  )
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
    | MODIFIER of (
# 19 "bin/parser.mly"
       (Ast.modifier)
# 46 "bin/parser.ml"
  )
    | MOD
    | MINUS
    | LPAREN
    | LESS_EQ
    | LESS
    | LBRACKET
    | LBRACE
    | INT_LIT of (
# 10 "bin/parser.mly"
       (int)
# 58 "bin/parser.ml"
  )
    | INCREMENT
    | IF
    | IDENT of (
# 7 "bin/parser.mly"
       (string)
# 65 "bin/parser.ml"
  )
    | GREATER_EQ
    | GREATER
    | FOR
    | FLOAT_LIT of (
# 11 "bin/parser.mly"
       (float)
# 73 "bin/parser.ml"
  )
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
    | BOOL_LIT of (
# 12 "bin/parser.mly"
       (bool)
# 89 "bin/parser.ml"
  )
    | BOOL_EQUALS
    | ASSIGN_TIMES
    | ASSIGN_PLUS
    | ASSIGN_MINUS
    | ASSIGN_EQUALS
    | ASSIGN_DIV
    | ARROW
    | AND
  
end

include MenhirBasics

# 1 "bin/parser.mly"
  
    open Ast

    (* exception BrokenParser *)

# 110 "bin/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState001 : (('s, _menhir_box_main) _menhir_cell1_MODIFIER, _menhir_box_main) _menhir_state
    (** State 001.
        Stack shape : MODIFIER.
        Start symbol: main. *)

  | MenhirState007 : (('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_state
    (** State 007.
        Stack shape : list(MODIFIER).
        Start symbol: main. *)

  | MenhirState017 : ((('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_STRUCTURE _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 017.
        Stack shape : list(MODIFIER) STRUCTURE IDENT.
        Start symbol: main. *)

  | MenhirState020 : (('s, _menhir_box_main) _menhir_cell1_classlevel_definition, _menhir_box_main) _menhir_state
    (** State 020.
        Stack shape : classlevel_definition.
        Start symbol: main. *)

  | MenhirState023 : ((('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_state
    (** State 023.
        Stack shape : list(MODIFIER) IDENT.
        Start symbol: main. *)

  | MenhirState029 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 029.
        Stack shape : typ IDENT.
        Start symbol: main. *)

  | MenhirState036 : (((('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_0__, _menhir_box_main) _menhir_state
    (** State 036.
        Stack shape : list(MODIFIER) IDENT loption(separated_nonempty_list(COMMA,__anonymous_0)).
        Start symbol: main. *)

  | MenhirState038 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 038.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState040 : (('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_state
    (** State 040.
        Stack shape : SWITCH.
        Start symbol: main. *)

  | MenhirState042 : (('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_state
    (** State 042.
        Stack shape : NOT.
        Start symbol: main. *)

  | MenhirState043 : (('s, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_state
    (** State 043.
        Stack shape : NEW.
        Start symbol: main. *)

  | MenhirState045 : ((('s, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 045.
        Stack shape : NEW typ.
        Start symbol: main. *)

  | MenhirState046 : (('s, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_state
    (** State 046.
        Stack shape : MINUS.
        Start symbol: main. *)

  | MenhirState047 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 047.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState049 : (('s, _menhir_box_main) _menhir_cell1_INCREMENT, _menhir_box_main) _menhir_state
    (** State 049.
        Stack shape : INCREMENT.
        Start symbol: main. *)

  | MenhirState055 : (('s, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_state
    (** State 055.
        Stack shape : IDENT.
        Start symbol: main. *)

  | MenhirState057 : (('s, _menhir_box_main) _menhir_cell1_DECREMENT, _menhir_box_main) _menhir_state
    (** State 057.
        Stack shape : DECREMENT.
        Start symbol: main. *)

  | MenhirState065 : (('s, _menhir_box_main) _menhir_cell1_primitive_type _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 065.
        Stack shape : primitive_type IDENT.
        Start symbol: main. *)

  | MenhirState075 : (('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 075.
        Stack shape : expression.
        Start symbol: main. *)

  | MenhirState076 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_TIMES, _menhir_box_main) _menhir_state
    (** State 076.
        Stack shape : expression TIMES.
        Start symbol: main. *)

  | MenhirState077 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_TIMES, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 077.
        Stack shape : expression TIMES expression.
        Start symbol: main. *)

  | MenhirState080 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_DOT _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 080.
        Stack shape : expression DOT IDENT.
        Start symbol: main. *)

  | MenhirState083 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_QUESTION_MARK, _menhir_box_main) _menhir_state
    (** State 083.
        Stack shape : expression QUESTION_MARK.
        Start symbol: main. *)

  | MenhirState084 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_QUESTION_MARK, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 084.
        Stack shape : expression QUESTION_MARK expression.
        Start symbol: main. *)

  | MenhirState085 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_PLUS, _menhir_box_main) _menhir_state
    (** State 085.
        Stack shape : expression PLUS.
        Start symbol: main. *)

  | MenhirState086 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_PLUS, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 086.
        Stack shape : expression PLUS expression.
        Start symbol: main. *)

  | MenhirState087 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_MOD, _menhir_box_main) _menhir_state
    (** State 087.
        Stack shape : expression MOD.
        Start symbol: main. *)

  | MenhirState088 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_MOD, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 088.
        Stack shape : expression MOD expression.
        Start symbol: main. *)

  | MenhirState089 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_DIV, _menhir_box_main) _menhir_state
    (** State 089.
        Stack shape : expression DIV.
        Start symbol: main. *)

  | MenhirState090 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_DIV, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 090.
        Stack shape : expression DIV expression.
        Start symbol: main. *)

  | MenhirState091 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_OR, _menhir_box_main) _menhir_state
    (** State 091.
        Stack shape : expression OR.
        Start symbol: main. *)

  | MenhirState092 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_OR, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 092.
        Stack shape : expression OR expression.
        Start symbol: main. *)

  | MenhirState093 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_NOT_EQUALS, _menhir_box_main) _menhir_state
    (** State 093.
        Stack shape : expression NOT_EQUALS.
        Start symbol: main. *)

  | MenhirState094 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_NOT_EQUALS, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 094.
        Stack shape : expression NOT_EQUALS expression.
        Start symbol: main. *)

  | MenhirState095 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_state
    (** State 095.
        Stack shape : expression MINUS.
        Start symbol: main. *)

  | MenhirState096 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 096.
        Stack shape : expression MINUS expression.
        Start symbol: main. *)

  | MenhirState097 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_LESS_EQ, _menhir_box_main) _menhir_state
    (** State 097.
        Stack shape : expression LESS_EQ.
        Start symbol: main. *)

  | MenhirState098 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_LESS_EQ, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 098.
        Stack shape : expression LESS_EQ expression.
        Start symbol: main. *)

  | MenhirState099 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_LESS, _menhir_box_main) _menhir_state
    (** State 099.
        Stack shape : expression LESS.
        Start symbol: main. *)

  | MenhirState100 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_LESS, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 100.
        Stack shape : expression LESS expression.
        Start symbol: main. *)

  | MenhirState101 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_GREATER_EQ, _menhir_box_main) _menhir_state
    (** State 101.
        Stack shape : expression GREATER_EQ.
        Start symbol: main. *)

  | MenhirState102 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_GREATER_EQ, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 102.
        Stack shape : expression GREATER_EQ expression.
        Start symbol: main. *)

  | MenhirState103 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_GREATER, _menhir_box_main) _menhir_state
    (** State 103.
        Stack shape : expression GREATER.
        Start symbol: main. *)

  | MenhirState104 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_GREATER, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 104.
        Stack shape : expression GREATER expression.
        Start symbol: main. *)

  | MenhirState105 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_BOOL_EQUALS, _menhir_box_main) _menhir_state
    (** State 105.
        Stack shape : expression BOOL_EQUALS.
        Start symbol: main. *)

  | MenhirState106 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_BOOL_EQUALS, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 106.
        Stack shape : expression BOOL_EQUALS expression.
        Start symbol: main. *)

  | MenhirState107 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_AND, _menhir_box_main) _menhir_state
    (** State 107.
        Stack shape : expression AND.
        Start symbol: main. *)

  | MenhirState108 : (((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_AND, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 108.
        Stack shape : expression AND expression.
        Start symbol: main. *)

  | MenhirState109 : ((((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_QUESTION_MARK, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_COLON, _menhir_box_main) _menhir_state
    (** State 109.
        Stack shape : expression QUESTION_MARK expression COLON.
        Start symbol: main. *)

  | MenhirState110 : (((((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_QUESTION_MARK, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_COLON, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 110.
        Stack shape : expression QUESTION_MARK expression COLON expression.
        Start symbol: main. *)

  | MenhirState111 : ((('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_COMMA, _menhir_box_main) _menhir_state
    (** State 111.
        Stack shape : expression COMMA.
        Start symbol: main. *)

  | MenhirState115 : ((('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 115.
        Stack shape : LPAREN expression.
        Start symbol: main. *)

  | MenhirState117 : ((('s, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 117.
        Stack shape : MINUS expression.
        Start symbol: main. *)

  | MenhirState120 : ((('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 120.
        Stack shape : NOT expression.
        Start symbol: main. *)

  | MenhirState121 : ((('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 121.
        Stack shape : SWITCH expression.
        Start symbol: main. *)

  | MenhirState122 : (((('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_state
    (** State 122.
        Stack shape : SWITCH expression RPAREN.
        Start symbol: main. *)

  | MenhirState123 : (('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_state
    (** State 123.
        Stack shape : PIPE.
        Start symbol: main. *)

  | MenhirState124 : ((('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 124.
        Stack shape : PIPE expression.
        Start symbol: main. *)

  | MenhirState125 : (((('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_state
    (** State 125.
        Stack shape : PIPE expression ARROW.
        Start symbol: main. *)

  | MenhirState126 : ((((('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 126.
        Stack shape : PIPE expression ARROW expression.
        Start symbol: main. *)

  | MenhirState129 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 129.
        Stack shape : WHILE expression.
        Start symbol: main. *)

  | MenhirState130 : (((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_state
    (** State 130.
        Stack shape : WHILE expression RPAREN.
        Start symbol: main. *)

  | MenhirState132 : (('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_state
    (** State 132.
        Stack shape : SWITCH.
        Start symbol: main. *)

  | MenhirState133 : ((('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 133.
        Stack shape : SWITCH expression.
        Start symbol: main. *)

  | MenhirState134 : (((('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_state
    (** State 134.
        Stack shape : SWITCH expression RPAREN.
        Start symbol: main. *)

  | MenhirState135 : ((((('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_state
    (** State 135.
        Stack shape : SWITCH expression RPAREN PIPE.
        Start symbol: main. *)

  | MenhirState136 : (((((('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 136.
        Stack shape : SWITCH expression RPAREN PIPE expression.
        Start symbol: main. *)

  | MenhirState137 : ((((((('s, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_state
    (** State 137.
        Stack shape : SWITCH expression RPAREN PIPE expression ARROW.
        Start symbol: main. *)

  | MenhirState138 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 138.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState141 : ((('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 141.
        Stack shape : RETURN expression.
        Start symbol: main. *)

  | MenhirState142 : (('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_state
    (** State 142.
        Stack shape : LBRACE.
        Start symbol: main. *)

  | MenhirState144 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 144.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState145 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 145.
        Stack shape : IF expression.
        Start symbol: main. *)

  | MenhirState146 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_state
    (** State 146.
        Stack shape : IF expression RPAREN.
        Start symbol: main. *)

  | MenhirState149 : (('s, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_state
    (** State 149.
        Stack shape : FOR.
        Start symbol: main. *)

  | MenhirState152 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 152.
        Stack shape : typ IDENT.
        Start symbol: main. *)

  | MenhirState153 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_state
    (** State 153.
        Stack shape : typ IDENT LBRACE.
        Start symbol: main. *)

  | MenhirState156 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 156.
        Stack shape : typ IDENT expression.
        Start symbol: main. *)

  | MenhirState160 : (('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_state
    (** State 160.
        Stack shape : lvalue.
        Start symbol: main. *)

  | MenhirState161 : ((('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 161.
        Stack shape : lvalue expression.
        Start symbol: main. *)

  | MenhirState162 : (('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_state
    (** State 162.
        Stack shape : lvalue.
        Start symbol: main. *)

  | MenhirState163 : ((('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 163.
        Stack shape : lvalue expression.
        Start symbol: main. *)

  | MenhirState164 : (('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_state
    (** State 164.
        Stack shape : lvalue.
        Start symbol: main. *)

  | MenhirState165 : ((('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 165.
        Stack shape : lvalue expression.
        Start symbol: main. *)

  | MenhirState166 : (('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_state
    (** State 166.
        Stack shape : lvalue.
        Start symbol: main. *)

  | MenhirState167 : ((('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 167.
        Stack shape : lvalue expression.
        Start symbol: main. *)

  | MenhirState168 : (('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_state
    (** State 168.
        Stack shape : lvalue.
        Start symbol: main. *)

  | MenhirState169 : ((('s, _menhir_box_main) _menhir_cell1_lvalue, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 169.
        Stack shape : lvalue expression.
        Start symbol: main. *)

  | MenhirState172 : ((('s, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_cell1_incomplete_statement, _menhir_box_main) _menhir_state
    (** State 172.
        Stack shape : FOR incomplete_statement.
        Start symbol: main. *)

  | MenhirState173 : (((('s, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_cell1_incomplete_statement, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 173.
        Stack shape : FOR incomplete_statement expression.
        Start symbol: main. *)

  | MenhirState174 : ((((('s, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_cell1_incomplete_statement, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ENDLINE, _menhir_box_main) _menhir_state
    (** State 174.
        Stack shape : FOR incomplete_statement expression ENDLINE.
        Start symbol: main. *)

  | MenhirState176 : (((((('s, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_cell1_incomplete_statement, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ENDLINE, _menhir_box_main) _menhir_cell1_incomplete_statement, _menhir_box_main) _menhir_state
    (** State 176.
        Stack shape : FOR incomplete_statement expression ENDLINE incomplete_statement.
        Start symbol: main. *)

  | MenhirState177 : (('s, _menhir_box_main) _menhir_cell1_DO, _menhir_box_main) _menhir_state
    (** State 177.
        Stack shape : DO.
        Start symbol: main. *)

  | MenhirState184 : ((('s, _menhir_box_main) _menhir_cell1_DO, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_state
    (** State 184.
        Stack shape : DO statement.
        Start symbol: main. *)

  | MenhirState185 : (((('s, _menhir_box_main) _menhir_cell1_DO, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 185.
        Stack shape : DO statement expression.
        Start symbol: main. *)

  | MenhirState191 : (('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 191.
        Stack shape : expression.
        Start symbol: main. *)

  | MenhirState194 : ((((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_state
    (** State 194.
        Stack shape : IF expression RPAREN statement.
        Start symbol: main. *)

  | MenhirState196 : (('s, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_state
    (** State 196.
        Stack shape : statement.
        Start symbol: main. *)

  | MenhirState200 : ((((('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_state
    (** State 200.
        Stack shape : PIPE expression ARROW statement.
        Start symbol: main. *)

  | MenhirState201 : (((((('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_state
    (** State 201.
        Stack shape : PIPE expression ARROW statement PIPE.
        Start symbol: main. *)

  | MenhirState202 : ((((((('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 202.
        Stack shape : PIPE expression ARROW statement PIPE expression.
        Start symbol: main. *)

  | MenhirState203 : (((((((('s, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_state
    (** State 203.
        Stack shape : PIPE expression ARROW statement PIPE expression ARROW.
        Start symbol: main. *)

  | MenhirState211 : ((('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 211.
        Stack shape : list(MODIFIER) typ IDENT.
        Start symbol: main. *)

  | MenhirState214 : (((('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_0__, _menhir_box_main) _menhir_state
    (** State 214.
        Stack shape : list(MODIFIER) typ IDENT loption(separated_nonempty_list(COMMA,__anonymous_0)).
        Start symbol: main. *)

  | MenhirState217 : ((('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 217.
        Stack shape : list(MODIFIER) typ IDENT.
        Start symbol: main. *)

  | MenhirState218 : (((('s, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 218.
        Stack shape : list(MODIFIER) typ IDENT expression.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_classlevel_definition = 
  | MenhirCell1_classlevel_definition of 's * ('s, 'r) _menhir_state * (Ast.statement)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Ast.expression)

and ('s, 'r) _menhir_cell1_incomplete_statement = 
  | MenhirCell1_incomplete_statement of 's * ('s, 'r) _menhir_state * (Ast.statement)

and ('s, 'r) _menhir_cell1_list_MODIFIER_ = 
  | MenhirCell1_list_MODIFIER_ of 's * ('s, 'r) _menhir_state * (Ast.modifier list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_0__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_0__ of 's * ('s, 'r) _menhir_state * ((Ast.typ * string) list)

and ('s, 'r) _menhir_cell1_lvalue = 
  | MenhirCell1_lvalue of 's * ('s, 'r) _menhir_state * (Ast.var)

and ('s, 'r) _menhir_cell1_primitive_type = 
  | MenhirCell1_primitive_type of 's * ('s, 'r) _menhir_state * (Ast.typ)

and ('s, 'r) _menhir_cell1_statement = 
  | MenhirCell1_statement of 's * ('s, 'r) _menhir_state * (Ast.statement)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Ast.typ)

and ('s, 'r) _menhir_cell1_AND = 
  | MenhirCell1_AND of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ARROW = 
  | MenhirCell1_ARROW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_BOOL_EQUALS = 
  | MenhirCell1_BOOL_EQUALS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COLON = 
  | MenhirCell1_COLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COMMA = 
  | MenhirCell1_COMMA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DECREMENT = 
  | MenhirCell1_DECREMENT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DIV = 
  | MenhirCell1_DIV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DO = 
  | MenhirCell1_DO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DOT = 
  | MenhirCell1_DOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ENDLINE = 
  | MenhirCell1_ENDLINE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FOR = 
  | MenhirCell1_FOR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GREATER = 
  | MenhirCell1_GREATER of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GREATER_EQ = 
  | MenhirCell1_GREATER_EQ of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 7 "bin/parser.mly"
       (string)
# 719 "bin/parser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 7 "bin/parser.mly"
       (string)
# 726 "bin/parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_INCREMENT = 
  | MenhirCell1_INCREMENT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACE = 
  | MenhirCell1_LBRACE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LESS = 
  | MenhirCell1_LESS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LESS_EQ = 
  | MenhirCell1_LESS_EQ of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MOD = 
  | MenhirCell1_MOD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MODIFIER = 
  | MenhirCell1_MODIFIER of 's * ('s, 'r) _menhir_state * (
# 19 "bin/parser.mly"
       (Ast.modifier)
# 757 "bin/parser.ml"
)

and ('s, 'r) _menhir_cell1_NEW = 
  | MenhirCell1_NEW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT_EQUALS = 
  | MenhirCell1_NOT_EQUALS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_OR = 
  | MenhirCell1_OR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PIPE = 
  | MenhirCell1_PIPE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_QUESTION_MARK = 
  | MenhirCell1_QUESTION_MARK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RPAREN = 
  | MenhirCell1_RPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STRUCTURE = 
  | MenhirCell1_STRUCTURE of 's * ('s, 'r) _menhir_state * (
# 20 "bin/parser.mly"
       (Ast.structureType)
# 791 "bin/parser.ml"
)

and ('s, 'r) _menhir_cell1_SWITCH = 
  | MenhirCell1_SWITCH of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TIMES = 
  | MenhirCell1_TIMES of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.statement list) [@@unboxed]

let _menhir_action_001 =
  fun xs ->
    let _2 = 
# 241 "<standard.mly>"
    ( xs )
# 811 "bin/parser.ml"
     in
    (
# 157 "bin/parser.mly"
    ( Array(_2) )
# 816 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_002 =
  fun _1 _2 _3 _5 ->
    (
# 126 "bin/parser.mly"
    ( VarDefinition(_1, _2, _3, (Some _5)) )
# 824 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_003 =
  fun _1 _2 _3 _5 ->
    (
# 129 "bin/parser.mly"
    ( VarDefinition(_1, _2, _3, (Some _5)) )
# 832 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_004 =
  fun _1 _2 _3 ->
    (
# 132 "bin/parser.mly"
    ( VarDefinition(_1, _2, _3, None) )
# 840 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_005 =
  fun _1 _2 _3 _8 xs ->
    let _5 =
      let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 849 "bin/parser.ml"
       in
      
# 165 "bin/parser.mly"
                                              ( _1 )
# 854 "bin/parser.ml"
      
    in
    (
# 135 "bin/parser.mly"
    ( MethodDefinition(_1, _2, _3, _5, _8) )
# 860 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_006 =
  fun _1 _2 _7 xs ->
    let _4 =
      let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 869 "bin/parser.ml"
       in
      
# 165 "bin/parser.mly"
                                              ( _1 )
# 874 "bin/parser.ml"
      
    in
    (
# 138 "bin/parser.mly"
    ( ConstructorDefinition(_1, _2, _4, _7) )
# 880 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_007 =
  fun _1 ->
    (
# 141 "bin/parser.mly"
    ( _1 )
# 888 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_008 =
  fun _2 ->
    (
# 247 "bin/parser.mly"
    ( _2 )
# 896 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_009 =
  fun _1 ->
    (
# 250 "bin/parser.mly"
    ( Access _1 )
# 904 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_010 =
  fun _1 ->
    (
# 253 "bin/parser.mly"
    ( _1 )
# 912 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_011 =
  fun _1 ->
    (
# 256 "bin/parser.mly"
    ( _1 )
# 920 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_012 =
  fun _1 ->
    (
# 259 "bin/parser.mly"
    ( _1 )
# 928 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_013 =
  fun _1 ->
    (
# 262 "bin/parser.mly"
    ( _1 )
# 936 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_014 =
  fun _2 ->
    (
# 265 "bin/parser.mly"
    ( Sub((Int 0), _2) )
# 944 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_015 =
  fun _2 xs ->
    let _4 =
      let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 953 "bin/parser.ml"
       in
      
# 161 "bin/parser.mly"
                                    ( _1 )
# 958 "bin/parser.ml"
      
    in
    (
# 268 "bin/parser.mly"
    ( ConstructorCall(_2, _4) )
# 964 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_016 =
  fun _1 _3 ->
    (
# 271 "bin/parser.mly"
    ( PrimitiveStaticField(_1, _3) )
# 972 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_017 =
  fun _1 _3 _5 ->
    (
# 275 "bin/parser.mly"
    ( Ternary(_1, _3, _5) )
# 980 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_018 =
  fun _3 _5 ->
    (
# 278 "bin/parser.mly"
    ( SwitchExpr(_3, _5) )
# 988 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_019 =
  fun _1 xs ->
    let _3 =
      let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 997 "bin/parser.ml"
       in
      
# 161 "bin/parser.mly"
                                    ( _1 )
# 1002 "bin/parser.ml"
      
    in
    (
# 147 "bin/parser.mly"
    ( FunctionCall(_1, _3) )
# 1008 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_020 =
  fun _1 _3 xs ->
    let _5 =
      let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 1017 "bin/parser.ml"
       in
      
# 161 "bin/parser.mly"
                                    ( _1 )
# 1022 "bin/parser.ml"
      
    in
    (
# 149 "bin/parser.mly"
    ( MethodCall(_1, _3, _5) )
# 1028 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_021 =
  fun _1 _3 xs ->
    let _5 =
      let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 1037 "bin/parser.ml"
       in
      
# 161 "bin/parser.mly"
                                    ( _1 )
# 1042 "bin/parser.ml"
      
    in
    (
# 151 "bin/parser.mly"
    ( PrimitiveStaticMethodCall(_1, _3, _5) )
# 1048 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_022 =
  fun _1 _2 _4 ->
    (
# 171 "bin/parser.mly"
    ( VarDefinition([], _1, _2, (Some _4)) )
# 1056 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_023 =
  fun _1 _2 _4 ->
    (
# 174 "bin/parser.mly"
    ( VarDefinition([], _1, _2, (Some _4)) )
# 1064 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_024 =
  fun _1 _2 ->
    (
# 177 "bin/parser.mly"
    ( VarDefinition([], _1, _2, None) )
# 1072 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_025 =
  fun _1 _3 ->
    (
# 180 "bin/parser.mly"
    ( Assign(_1, _3) )
# 1080 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_026 =
  fun _1 _3 ->
    (
# 184 "bin/parser.mly"
    ( Assign(_1, Add(Access _1, _3)))
# 1088 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_027 =
  fun _1 _3 ->
    (
# 186 "bin/parser.mly"
    ( Assign(_1, Sub(Access _1, _3)))
# 1096 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_028 =
  fun _1 _3 ->
    (
# 188 "bin/parser.mly"
    ( Assign(_1, Mul(Access _1, _3)))
# 1104 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_029 =
  fun _1 _3 ->
    (
# 190 "bin/parser.mly"
    ( Assign(_1, Div(Access _1, _3)))
# 1112 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_030 =
  fun _1 ->
    (
# 193 "bin/parser.mly"
    ( ExpressionStatement(_1) )
# 1120 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_031 =
  fun _1 ->
    (
# 196 "bin/parser.mly"
    ( ExpressionStatement(_1) )
# 1128 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_032 =
  fun _1 ->
    (
# 333 "bin/parser.mly"
    ( PostIncrement(_1) )
# 1136 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_033 =
  fun _2 ->
    (
# 335 "bin/parser.mly"
    ( PreIncrement(_2) )
# 1144 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_034 =
  fun _1 ->
    (
# 337 "bin/parser.mly"
    ( PostDecrement(_1) )
# 1152 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_035 =
  fun _2 ->
    (
# 339 "bin/parser.mly"
    ( PreDecrement(_2) )
# 1160 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_036 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1168 "bin/parser.ml"
     : (Ast.modifier list))

let _menhir_action_037 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1176 "bin/parser.ml"
     : (Ast.modifier list))

let _menhir_action_038 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1184 "bin/parser.ml"
     : (Ast.statement list))

let _menhir_action_039 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1192 "bin/parser.ml"
     : (Ast.statement list))

let _menhir_action_040 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1200 "bin/parser.ml"
     : (Ast.statement list))

let _menhir_action_041 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1208 "bin/parser.ml"
     : (Ast.statement list))

let _menhir_action_042 =
  fun _1 ->
    (
# 318 "bin/parser.mly"
    ( Int(_1) )
# 1216 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_043 =
  fun _1 ->
    (
# 321 "bin/parser.mly"
    ( Float(_1) )
# 1224 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_044 =
  fun _1 ->
    (
# 324 "bin/parser.mly"
    ( Bool(_1) )
# 1232 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_045 =
  fun _1 ->
    (
# 327 "bin/parser.mly"
    ( String(_1) )
# 1240 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_046 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1248 "bin/parser.ml"
     : ((Ast.typ * string) list))

let _menhir_action_047 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1256 "bin/parser.ml"
     : ((Ast.typ * string) list))

let _menhir_action_048 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1264 "bin/parser.ml"
     : (Ast.expression list))

let _menhir_action_049 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1272 "bin/parser.ml"
     : (Ast.expression list))

let _menhir_action_050 =
  fun _1 ->
    (
# 236 "bin/parser.mly"
        ( Var(_1) )
# 1280 "bin/parser.ml"
     : (Ast.var))

let _menhir_action_051 =
  fun _1 _3 ->
    (
# 237 "bin/parser.mly"
                   ( Field(Access _1, _3) )
# 1288 "bin/parser.ml"
     : (Ast.var))

let _menhir_action_052 =
  fun _1 ->
    (
# 93 "bin/parser.mly"
                                  ( _1 )
# 1296 "bin/parser.ml"
     : (Ast.statement list))

let _menhir_action_053 =
  fun _1 _3 ->
    (
# 284 "bin/parser.mly"
    ( Add(_1, _3) )
# 1304 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_054 =
  fun _1 _3 ->
    (
# 286 "bin/parser.mly"
    ( Sub(_1, _3) )
# 1312 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_055 =
  fun _1 _3 ->
    (
# 288 "bin/parser.mly"
    ( Mul(_1, _3) )
# 1320 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_056 =
  fun _1 _3 ->
    (
# 290 "bin/parser.mly"
    ( Div(_1, _3) )
# 1328 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_057 =
  fun _1 _3 ->
    (
# 292 "bin/parser.mly"
    ( Mod(_1, _3) )
# 1336 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_058 =
  fun _1 _3 ->
    (
# 295 "bin/parser.mly"
    ( And(_1, _3) )
# 1344 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_059 =
  fun _1 _3 ->
    (
# 297 "bin/parser.mly"
    ( Or(_1, _3) )
# 1352 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_060 =
  fun _2 ->
    (
# 299 "bin/parser.mly"
    ( Not(_2) )
# 1360 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_061 =
  fun _1 _3 ->
    (
# 301 "bin/parser.mly"
    ( Equals(_1, _3) )
# 1368 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_062 =
  fun _1 _3 ->
    (
# 303 "bin/parser.mly"
    ( NotEquals(_1, _3) )
# 1376 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_063 =
  fun _1 _3 ->
    (
# 306 "bin/parser.mly"
    ( LessEq(_1, _3) )
# 1384 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_064 =
  fun _1 _3 ->
    (
# 308 "bin/parser.mly"
    ( Less(_1, _3) )
# 1392 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_065 =
  fun _1 _3 ->
    (
# 310 "bin/parser.mly"
    ( GreaterEq(_1, _3) )
# 1400 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_066 =
  fun _1 _3 ->
    (
# 312 "bin/parser.mly"
    ( Greater(_1, _3) )
# 1408 "bin/parser.ml"
     : (Ast.expression))

let _menhir_action_067 =
  fun x y ->
    let x =
      let x = 
# 205 "<standard.mly>"
    ( x )
# 1417 "bin/parser.ml"
       in
      
# 172 "<standard.mly>"
    ( (x, y) )
# 1422 "bin/parser.ml"
      
    in
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 1428 "bin/parser.ml"
     : ((Ast.expression * Ast.expression) list))

let _menhir_action_068 =
  fun x xs y ->
    let x =
      let x = 
# 205 "<standard.mly>"
    ( x )
# 1437 "bin/parser.ml"
       in
      
# 172 "<standard.mly>"
    ( (x, y) )
# 1442 "bin/parser.ml"
      
    in
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 1448 "bin/parser.ml"
     : ((Ast.expression * Ast.expression) list))

let _menhir_action_069 =
  fun x y ->
    let x =
      let x = 
# 205 "<standard.mly>"
    ( x )
# 1457 "bin/parser.ml"
       in
      
# 172 "<standard.mly>"
    ( (x, y) )
# 1462 "bin/parser.ml"
      
    in
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 1468 "bin/parser.ml"
     : ((Ast.expression * Ast.statement) list))

let _menhir_action_070 =
  fun x xs y ->
    let x =
      let x = 
# 205 "<standard.mly>"
    ( x )
# 1477 "bin/parser.ml"
       in
      
# 172 "<standard.mly>"
    ( (x, y) )
# 1482 "bin/parser.ml"
      
    in
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 1488 "bin/parser.ml"
     : ((Ast.expression * Ast.statement) list))

let _menhir_action_071 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 1496 "bin/parser.ml"
     : (Ast.expression option))

let _menhir_action_072 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 1504 "bin/parser.ml"
     : (Ast.expression option))

let _menhir_action_073 =
  fun () ->
    (
# 103 "bin/parser.mly"
            ( TBool )
# 1512 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_074 =
  fun () ->
    (
# 104 "bin/parser.mly"
            ( TInt )
# 1520 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_075 =
  fun () ->
    (
# 105 "bin/parser.mly"
            ( TFloat )
# 1528 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_076 =
  fun () ->
    (
# 106 "bin/parser.mly"
            ( TChar )
# 1536 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_077 =
  fun () ->
    (
# 107 "bin/parser.mly"
            ( TString )
# 1544 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_078 =
  fun () ->
    (
# 108 "bin/parser.mly"
            ( TVoid )
# 1552 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_079 =
  fun () ->
    (
# 109 "bin/parser.mly"
            ( TObject )
# 1560 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_080 =
  fun _1 _2 ->
    let x = 
# 165 "bin/parser.mly"
                                  ((_1, _2))
# 1568 "bin/parser.ml"
     in
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1573 "bin/parser.ml"
     : ((Ast.typ * string) list))

let _menhir_action_081 =
  fun _1 _2_inlined1 xs ->
    let x =
      let _2 = _2_inlined1 in
      
# 165 "bin/parser.mly"
                                  ((_1, _2))
# 1583 "bin/parser.ml"
      
    in
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1589 "bin/parser.ml"
     : ((Ast.typ * string) list))

let _menhir_action_082 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1597 "bin/parser.ml"
     : (Ast.expression list))

let _menhir_action_083 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1605 "bin/parser.ml"
     : (Ast.expression list))

let _menhir_action_084 =
  fun _2 ->
    (
# 203 "bin/parser.mly"
    ( Scope(_2) )
# 1613 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_085 =
  fun _1 ->
    (
# 205 "bin/parser.mly"
    ( _1 )
# 1621 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_086 =
  fun _2 ->
    (
# 208 "bin/parser.mly"
    ( Return(_2) )
# 1629 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_087 =
  fun _3 _5 ->
    (
# 212 "bin/parser.mly"
    ( If(_3, _5, None) )
# 1637 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_088 =
  fun _3 _5 _7 ->
    (
# 214 "bin/parser.mly"
    ( If(_3, _5, (Some _7)) )
# 1645 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_089 =
  fun _3 _5 ->
    (
# 218 "bin/parser.mly"
    ( Switch(_3, _5) )
# 1653 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_090 =
  fun _3 _5 _7 _9 ->
    (
# 222 "bin/parser.mly"
    ( For(_3, _5, _7, _9) )
# 1661 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_091 =
  fun _3 _5 ->
    (
# 224 "bin/parser.mly"
    ( While(_3, _5))
# 1669 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_092 =
  fun _2 _5 ->
    (
# 226 "bin/parser.mly"
    ( DoWhile(_5, _2))
# 1677 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_093 =
  fun () ->
    (
# 229 "bin/parser.mly"
    ( Break )
# 1685 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_094 =
  fun () ->
    (
# 231 "bin/parser.mly"
    ( Continue )
# 1693 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_095 =
  fun _1 _2 _3 _5 ->
    (
# 99 "bin/parser.mly"
    ( StructureDefinition(_1, _2, _3, _5) )
# 1701 "bin/parser.ml"
     : (Ast.statement))

let _menhir_action_096 =
  fun _1 ->
    (
# 114 "bin/parser.mly"
    ( _1 )
# 1709 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_097 =
  fun _1 ->
    (
# 116 "bin/parser.mly"
    ( TPointer(_1) )
# 1717 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_098 =
  fun _1 ->
    (
# 118 "bin/parser.mly"
    ( TArray(_1) )
# 1725 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_099 =
  fun _1 ->
    (
# 120 "bin/parser.mly"
    ( TCustom(_1) )
# 1733 "bin/parser.ml"
     : (Ast.typ))

let _menhir_action_100 =
  fun _1 ->
    (
# 240 "bin/parser.mly"
         ( _1 )
# 1741 "bin/parser.ml"
     : (Ast.var))

let _menhir_action_101 =
  fun _1 _3 ->
    (
# 241 "bin/parser.mly"
                       ( Field(_1, _3) )
# 1749 "bin/parser.ml"
     : (Ast.var))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | ARROW ->
        "ARROW"
    | ASSIGN_DIV ->
        "ASSIGN_DIV"
    | ASSIGN_EQUALS ->
        "ASSIGN_EQUALS"
    | ASSIGN_MINUS ->
        "ASSIGN_MINUS"
    | ASSIGN_PLUS ->
        "ASSIGN_PLUS"
    | ASSIGN_TIMES ->
        "ASSIGN_TIMES"
    | BOOL_EQUALS ->
        "BOOL_EQUALS"
    | BOOL_LIT _ ->
        "BOOL_LIT"
    | BREAK ->
        "BREAK"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | CONTINUE ->
        "CONTINUE"
    | DECREMENT ->
        "DECREMENT"
    | DIV ->
        "DIV"
    | DO ->
        "DO"
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | ENDLINE ->
        "ENDLINE"
    | EOF ->
        "EOF"
    | FLOAT_LIT _ ->
        "FLOAT_LIT"
    | FOR ->
        "FOR"
    | GREATER ->
        "GREATER"
    | GREATER_EQ ->
        "GREATER_EQ"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | INCREMENT ->
        "INCREMENT"
    | INT_LIT _ ->
        "INT_LIT"
    | LBRACE ->
        "LBRACE"
    | LBRACKET ->
        "LBRACKET"
    | LESS ->
        "LESS"
    | LESS_EQ ->
        "LESS_EQ"
    | LPAREN ->
        "LPAREN"
    | MINUS ->
        "MINUS"
    | MOD ->
        "MOD"
    | MODIFIER _ ->
        "MODIFIER"
    | NEW ->
        "NEW"
    | NOT ->
        "NOT"
    | NOT_EQUALS ->
        "NOT_EQUALS"
    | OR ->
        "OR"
    | PIPE ->
        "PIPE"
    | PLUS ->
        "PLUS"
    | QUESTION_MARK ->
        "QUESTION_MARK"
    | RBRACE ->
        "RBRACE"
    | RBRACKET ->
        "RBRACKET"
    | RETURN ->
        "RETURN"
    | RPAREN ->
        "RPAREN"
    | STRING_LIT _ ->
        "STRING_LIT"
    | STRUCTURE _ ->
        "STRUCTURE"
    | SWITCH ->
        "SWITCH"
    | TBOOL ->
        "TBOOL"
    | TCHAR ->
        "TCHAR"
    | TFLOAT ->
        "TFLOAT"
    | TIMES ->
        "TIMES"
    | TINT ->
        "TINT"
    | TOBJECT ->
        "TOBJECT"
    | TSTRING ->
        "TSTRING"
    | TVOID ->
        "TVOID"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_005 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_052 _1 in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_MODIFIER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MODIFIER _v_0 ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState001
      | IDENT _ | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let _v_1 = _menhir_action_036 () in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_MODIFIER -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MODIFIER (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_037 x xs in
      _menhir_goto_list_MODIFIER_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_MODIFIER_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState020 ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState017 ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_MODIFIER_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | STRUCTURE _v_0 ->
          let _menhir_stack = MenhirCell1_STRUCTURE (_menhir_stack, MenhirState007, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_1 ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_1) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LBRACE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | MODIFIER _v_2 ->
                      _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState017
                  | IDENT _ | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
                      let _v_3 = _menhir_action_036 () in
                      _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState017 _tok
                  | RBRACE ->
                      let _v_4 = _menhir_action_038 () in
                      _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | IDENT _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, MenhirState007, _v_5) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
              | IDENT _v_6 ->
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState023
              | RPAREN ->
                  let _v_7 = _menhir_action_046 () in
                  _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState023
              | _ ->
                  _eRR ())
          | IDENT _ | LBRACKET ->
              let _v_8 =
                let _1 = _v_5 in
                _menhir_action_099 _1
              in
              _menhir_run_209 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState007 _tok
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_008 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_078 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_primitive_type : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState214 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState203 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState177 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState217 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState164 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState153 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState135 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState125 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState211 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_158 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v) in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _ | LBRACKET ->
          let _1 = _v in
          let _v = _menhir_action_096 _1 in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_primitive_type -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _v = _menhir_action_097 _1 in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState007 ->
          _menhir_run_209 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState203 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState177 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState211 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_209 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LBRACKET ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
              | IDENT _v_1 ->
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState211
              | RPAREN ->
                  let _v_2 = _menhir_action_046 () in
                  _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState211
              | _ ->
                  _eRR ())
          | ASSIGN_EQUALS ->
              let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
              let _menhir_s = MenhirState217 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | SWITCH ->
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING_LIT _v ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NOT ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NEW ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRACE ->
                  _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT_LIT _v ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | INCREMENT ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FLOAT_LIT _v ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DECREMENT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | BOOL_LIT _v ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | EOF | IDENT _ | MODIFIER _ | RBRACE | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
              let MenhirCell1_list_MODIFIER_ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
              let (_3, _2) = (_v_0, _v) in
              let _v = _menhir_action_004 _1 _2 _3 in
              _menhir_goto_classlevel_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _v = _menhir_action_098 _1 in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_009 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_077 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_010 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_079 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_074 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_012 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_075 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_076 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_073 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_024 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_099 _1 in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_212 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_0__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | STRING_LIT _v_0 ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState214
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | INT_LIT _v_1 ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState214
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | IDENT _v_2 ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState214
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | FLOAT_LIT _v_3 ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState214
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
          | BOOL_LIT _v_4 ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState214
          | RBRACE ->
              let _v_5 = _menhir_action_040 () in
              _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState038 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SWITCH (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState040 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_045 _1 in
      _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_literal : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_010 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState217 ->
          _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState203 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState177 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState164 ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_163 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState135 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState125 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState153 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_218 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
      | EOF | IDENT _ | MODIFIER _ | RBRACE | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_list_MODIFIER_ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_002 _1 _2 _3 _5 in
          _menhir_goto_classlevel_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TIMES (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState076 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState042 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NEW (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState043 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_046 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState046 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState047 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_042 _1 in
      _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_INCREMENT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState049 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_050 _1 in
      _menhir_goto_lvalue _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_lvalue : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState214 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState203 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState177 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState217 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState164 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState153 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState135 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState125 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_159 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | INCREMENT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DECREMENT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGN_TIMES ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState160 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASSIGN_PLUS ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState162 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASSIGN_MINUS ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState164 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASSIGN_EQUALS ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState166 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASSIGN_DIV ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState168 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | BOOL_EQUALS | DIV | GREATER | GREATER_EQ | LESS | LESS_EQ | MINUS | MOD | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | TIMES ->
          let _1 = _v in
          let _v = _menhir_action_100 _1 in
          _menhir_goto_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_lvalue -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _v = _menhir_action_032 _1 in
      _menhir_goto_incr_decr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_incr_decr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState214 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState203 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState177 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState217 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState164 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState153 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState135 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState125 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_170 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND | BOOL_EQUALS | DIV | DOT | GREATER | GREATER_EQ | LESS | LESS_EQ | MINUS | MOD | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | TIMES ->
          let _1 = _v in
          let _v = _menhir_action_011 _1 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ENDLINE | RPAREN ->
          let _1 = _v in
          let _v = _menhir_action_030 _1 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_incomplete_statement : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState214 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState203 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState177 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_188 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ENDLINE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_085 _1 in
          _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_statement : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState130 ->
          _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState203 ->
          _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState146 ->
          _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState177 ->
          _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_206 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_RPAREN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_091 _3 _5 in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_200 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          let _menhir_stack = MenhirCell1_statement (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_PIPE (_menhir_stack, MenhirState200) in
          let _menhir_s = MenhirState201 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | BOOL_LIT _ | BREAK | CONTINUE | DECREMENT | DO | ELSE | FLOAT_LIT _ | FOR | IDENT _ | IF | INCREMENT | INT_LIT _ | LBRACE | LPAREN | MINUS | NEW | NOT | RBRACE | RETURN | STRING_LIT _ | SWITCH | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID | WHILE ->
          let MenhirCell1_ARROW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, x) = _menhir_stack in
          let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
          let y = _v in
          let _v = _menhir_action_069 x y in
          _menhir_goto_nonempty_list_pair_delimited_PIPE_expression_ARROW__statement__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_054 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DECREMENT | DIV | DOT | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | INCREMENT | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let _1 = _v in
          let _v = _menhir_action_050 _1 in
          _menhir_goto_lvalue _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENT -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | RPAREN ->
          let _v = _menhir_action_048 () in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_043 _1 in
      _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DECREMENT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState057 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_044 _1 in
      _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_113 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_019 _1 xs in
          _menhir_goto_function_call _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_function_call : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState214 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState203 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState194 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState176 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState177 ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState217 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState164 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState153 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState135 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState125 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_190 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND | BOOL_EQUALS | DIV | DOT | GREATER | GREATER_EQ | LESS | LESS_EQ | MINUS | MOD | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | TIMES ->
          let _1 = _v in
          let _v = _menhir_action_013 _1 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ENDLINE | RPAREN ->
          let _1 = _v in
          let _v = _menhir_action_031 _1 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_013 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_nonempty_list_pair_delimited_PIPE_expression_ARROW__statement__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState134 ->
          _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState200 ->
          _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_205 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_RPAREN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_SWITCH (_menhir_stack, _menhir_s) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_089 _3 _5 in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_204 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_statement -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_statement (_menhir_stack, _, y) = _menhir_stack in
      let MenhirCell1_ARROW (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, x) = _menhir_stack in
      let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_070 x xs y in
      _menhir_goto_nonempty_list_pair_delimited_PIPE_expression_ARROW__statement__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_196 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_statement (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | SWITCH ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | STRING_LIT _v_0 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState196
      | RETURN ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | LBRACE ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | INT_LIT _v_1 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState196
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | IF ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | IDENT _v_2 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState196
      | FOR ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | FLOAT_LIT _v_3 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState196
      | DO ->
          _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | CONTINUE ->
          _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | BREAK ->
          _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState196
      | BOOL_LIT _v_4 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState196
      | RBRACE ->
          let _v_5 = _menhir_action_040 () in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5
      | _ ->
          _eRR ()
  
  and _menhir_run_131 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SWITCH (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState132 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_138 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState138 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ENDLINE ->
          let _v = _menhir_action_071 () in
          _menhir_goto_option_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_goto_option_expression_ : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_086 _2 in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_142 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | SWITCH ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState142
      | RETURN ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | LBRACE ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState142
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | IF ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | IDENT _v ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState142
      | FOR ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState142
      | DO ->
          _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | CONTINUE ->
          _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | BREAK ->
          _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState142
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState142
      | RBRACE ->
          let _v = _menhir_action_040 () in
          _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_143 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState144 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_147 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSIGN_DIV | ASSIGN_EQUALS | ASSIGN_MINUS | ASSIGN_PLUS | ASSIGN_TIMES | BOOL_EQUALS | DECREMENT | DIV | DOT | GREATER | GREATER_EQ | INCREMENT | LESS | LESS_EQ | MINUS | MOD | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | TIMES ->
          let _1 = _v in
          let _v = _menhir_action_050 _1 in
          _menhir_goto_lvalue _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | IDENT _ | LBRACKET ->
          let _1 = _v in
          let _v = _menhir_action_099 _1 in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_148 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FOR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState149 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_177 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DO (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState177 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FOR ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DO ->
          _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONTINUE ->
          _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BREAK ->
          _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_178 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ENDLINE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_094 () in
          _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_180 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ENDLINE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_093 () in
          _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_198 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_084 _2 in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_197 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_statement -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_statement (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_041 x xs in
      _menhir_goto_list_statement_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_statement_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState214 ->
          _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState036 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState142 ->
          _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState196 ->
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_215 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_0__ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_0__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_list_MODIFIER_ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _8 = _v in
      let _v = _menhir_action_005 _1 _2 _3 _8 xs in
      _menhir_goto_classlevel_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_classlevel_definition : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_classlevel_definition (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MODIFIER _v_0 ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState020
      | IDENT _ | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let _v_1 = _menhir_action_036 () in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState020 _tok
      | EOF | RBRACE ->
          let _v_2 = _menhir_action_038 () in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_classlevel_definition -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_classlevel_definition (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_039 x xs in
      _menhir_goto_list_classlevel_definition_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_classlevel_definition_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState020 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState017 ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_005 _menhir_stack _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_018 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_STRUCTURE _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_STRUCTURE (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_list_MODIFIER_ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_095 _1 _2 _3 _5 in
          let _1 = _v in
          let _v = _menhir_action_007 _1 in
          _menhir_goto_classlevel_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_207 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_0__ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_0__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_IDENT (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_list_MODIFIER_ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _7 = _v in
      let _v = _menhir_action_006 _1 _2 _7 xs in
      _menhir_goto_classlevel_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_195 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_cell1_statement -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_statement (_menhir_stack, _, _5) = _menhir_stack in
      let MenhirCell1_RPAREN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let _7 = _v in
      let _v = _menhir_action_088 _3 _5 _7 in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_193 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_statement (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState194 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | BOOL_LIT _ | BREAK | CONTINUE | DECREMENT | DO | FLOAT_LIT _ | FOR | IDENT _ | IF | INCREMENT | INT_LIT _ | LBRACE | LPAREN | MINUS | NEW | NOT | PIPE | RBRACE | RETURN | STRING_LIT _ | SWITCH | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID | WHILE ->
          let MenhirCell1_RPAREN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_087 _3 _5 in
          _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_192 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_cell1_incomplete_statement, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ENDLINE, _menhir_box_main) _menhir_cell1_incomplete_statement -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_incomplete_statement (_menhir_stack, _, _7) = _menhir_stack in
      let MenhirCell1_ENDLINE (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, _5) = _menhir_stack in
      let MenhirCell1_incomplete_statement (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_FOR (_menhir_stack, _menhir_s) = _menhir_stack in
      let _9 = _v in
      let _v = _menhir_action_090 _3 _5 _7 _9 in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_182 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_DO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_statement (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_s = MenhirState184 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | SWITCH ->
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING_LIT _v ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NOT ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NEW ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT_LIT _v ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | INCREMENT ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FLOAT_LIT _v ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DECREMENT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | BOOL_LIT _v ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_175 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_cell1_incomplete_statement, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ENDLINE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_incomplete_statement (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _menhir_s = MenhirState176 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_171 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_FOR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_incomplete_statement (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ENDLINE ->
          let _menhir_s = MenhirState172 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_011 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_052 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_lvalue -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_051 _1 _3 in
          _menhir_goto_lvalue _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_lvalue -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _v = _menhir_action_034 _1 in
      _menhir_goto_incr_decr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_var : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_009 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | INCREMENT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DECREMENT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let _1 = _v in
          let _v = _menhir_action_100 _1 in
          _menhir_goto_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_058 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_DECREMENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_DECREMENT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_035 _2 in
          _menhir_goto_incr_decr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_051 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_INCREMENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_lvalue (_menhir_stack, _menhir_s, _v) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_INCREMENT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_033 _2 in
          _menhir_goto_incr_decr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_QUESTION_MARK (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState083 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState085 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState091 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT_EQUALS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState093 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MOD (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState087 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState095 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LESS_EQ (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState097 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LESS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState099 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_GREATER_EQ (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState101 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_103 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_GREATER (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState103 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_stack = MenhirCell1_DOT (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | SWITCH ->
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | STRING_LIT _v_0 ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState080
              | NOT ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | NEW ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | MINUS ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | LPAREN ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | INT_LIT _v_1 ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState080
              | INCREMENT ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | IDENT _v_2 ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState080
              | FLOAT_LIT _v_3 ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState080
              | DECREMENT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
              | BOOL_LIT _v_4 ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState080
              | RPAREN ->
                  let _v_5 = _menhir_action_048 () in
                  _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 _tok
              | _ ->
                  _eRR ())
          | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | DOT | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
              let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
              let _3 = _v in
              let _v = _menhir_action_101 _1 _3 in
              _menhir_goto_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_DOT _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_DOT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_020 _1 _3 xs in
          _menhir_goto_function_call _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState089 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_105 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_BOOL_EQUALS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState105 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_107 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState107 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_202 : type  ttv_stack. ((((((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_statement, _menhir_box_main) _menhir_cell1_PIPE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | ARROW ->
          let _menhir_stack = MenhirCell1_ARROW (_menhir_stack, MenhirState202) in
          let _menhir_s = MenhirState203 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | _ ->
          _eRR ()
  
  and _menhir_run_191 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | _ ->
          _eRR ()
  
  and _menhir_run_185 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_DO, _menhir_box_main) _menhir_cell1_statement as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ENDLINE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_statement (_menhir_stack, _, _2) = _menhir_stack in
              let MenhirCell1_DO (_menhir_stack, _menhir_s) = _menhir_stack in
              let _5 = _v in
              let _v = _menhir_action_092 _2 _5 in
              _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | _ ->
          _eRR ()
  
  and _menhir_run_173 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_FOR, _menhir_box_main) _menhir_cell1_incomplete_statement as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | ENDLINE ->
          let _menhir_stack = MenhirCell1_ENDLINE (_menhir_stack, MenhirState173) in
          let _menhir_s = MenhirState174 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
      | _ ->
          _eRR ()
  
  and _menhir_run_169 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_lvalue as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | ENDLINE | RPAREN ->
          let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_029 _1 _3 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_167 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_lvalue as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | ENDLINE | RPAREN ->
          let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_025 _1 _3 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_165 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_lvalue as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | ENDLINE | RPAREN ->
          let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_027 _1 _3 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_163 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_lvalue as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | ENDLINE | RPAREN ->
          let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_026 _1 _3 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_161 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_lvalue as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | ENDLINE | RPAREN ->
          let MenhirCell1_lvalue (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_028 _1 _3 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_156 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | ENDLINE | RPAREN ->
          let MenhirCell0_IDENT (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_022 _1 _2 _4 in
          _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_145 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | RPAREN ->
          let _menhir_stack = MenhirCell1_RPAREN (_menhir_stack, MenhirState145) in
          let _menhir_s = MenhirState146 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | _ ->
          _eRR ()
  
  and _menhir_run_141 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_RETURN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | ENDLINE ->
          let x = _v in
          let _v = _menhir_action_072 x in
          _menhir_goto_option_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_136 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_cell1_PIPE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | ARROW ->
          let _menhir_stack = MenhirCell1_ARROW (_menhir_stack, MenhirState136) in
          let _menhir_s = MenhirState137 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | _ ->
          _eRR ()
  
  and _menhir_run_133 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_SWITCH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | RPAREN ->
          let _menhir_stack = MenhirCell1_RPAREN (_menhir_stack, MenhirState133) in
          let _menhir_s = MenhirState134 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PIPE ->
              let _menhir_stack = MenhirCell1_PIPE (_menhir_stack, _menhir_s) in
              let _menhir_s = MenhirState135 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | SWITCH ->
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING_LIT _v ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NOT ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NEW ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT_LIT _v ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | INCREMENT ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FLOAT_LIT _v ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DECREMENT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | BOOL_LIT _v ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | _ ->
          _eRR ()
  
  and _menhir_run_129 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | RPAREN ->
          let _menhir_stack = MenhirCell1_RPAREN (_menhir_stack, MenhirState129) in
          let _menhir_s = MenhirState130 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | _ ->
          _eRR ()
  
  and _menhir_run_126 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | PIPE ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
      | ARROW | COLON | COMMA | ENDLINE | EOF | IDENT _ | MODIFIER _ | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_ARROW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, x) = _menhir_stack in
          let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
          let y = _v in
          let _v = _menhir_action_067 x y in
          _menhir_goto_nonempty_list_pair_delimited_PIPE_expression_ARROW__expression__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_123 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PIPE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState123 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_pair_delimited_PIPE_expression_ARROW__expression__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState134 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState122 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState126 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_128 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_SWITCH, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_RPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_RPAREN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_SWITCH (_menhir_stack, _menhir_s) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_018 _3 _5 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_127 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _, y) = _menhir_stack in
      let MenhirCell1_ARROW (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, x) = _menhir_stack in
      let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_068 x xs y in
      _menhir_goto_nonempty_list_pair_delimited_PIPE_expression_ARROW__expression__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_124 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | ARROW ->
          let _menhir_stack = MenhirCell1_ARROW (_menhir_stack, MenhirState124) in
          let _menhir_s = MenhirState125 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | _ ->
          _eRR ()
  
  and _menhir_run_121 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_SWITCH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | RPAREN ->
          let _menhir_stack = MenhirCell1_RPAREN (_menhir_stack, MenhirState121) in
          let _menhir_s = MenhirState122 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PIPE ->
              _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_NOT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_060 _2 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_math_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_012 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_117 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_014 _2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_115 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_008 _2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | _ ->
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_QUESTION_MARK, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_COLON as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | ARROW | COLON | COMMA | ENDLINE | EOF | IDENT _ | MODIFIER _ | PIPE | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_COLON (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_QUESTION_MARK (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_017 _1 _3 _5 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_AND as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | AND | ARROW | COLON | COMMA | ENDLINE | EOF | IDENT _ | MODIFIER _ | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_AND (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_058 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_BOOL_EQUALS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | IDENT _ | MODIFIER _ | NOT_EQUALS | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_BOOL_EQUALS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_061 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_GREATER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState104
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState104
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState104
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState104
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState104
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState104
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MODIFIER _ | NOT_EQUALS | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_GREATER (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_066 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_GREATER_EQ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MODIFIER _ | NOT_EQUALS | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_GREATER_EQ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_065 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_LESS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MODIFIER _ | NOT_EQUALS | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_LESS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_064 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_LESS_EQ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MODIFIER _ | NOT_EQUALS | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_LESS_EQ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_063 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_MINUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_054 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_NOT_EQUALS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | IDENT _ | MODIFIER _ | NOT_EQUALS | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_NOT_EQUALS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_062 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_OR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | ARROW | COLON | COMMA | ENDLINE | EOF | IDENT _ | MODIFIER _ | OR | PIPE | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_OR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_059 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_DIV as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_DIV (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_056 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_MOD as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_MOD (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_057 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_PLUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState086
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState086
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState086
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState086
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_PLUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_053 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_QUESTION_MARK as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | QUESTION_MARK ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | PLUS ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | OR ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | NOT_EQUALS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | MOD ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | MINUS ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | LESS_EQ ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | LESS ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | GREATER_EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | GREATER ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | DOT ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | DIV ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | COLON ->
          let _menhir_stack = MenhirCell1_COLON (_menhir_stack, MenhirState084) in
          let _menhir_s = MenhirState109 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | BOOL_EQUALS ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | AND ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_TIMES as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
          let MenhirCell1_TIMES (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_055 _1 _3 in
          _menhir_goto_math_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | OR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | NOT_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | MOD ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | LESS_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | LESS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | GREATER_EQ ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | GREATER ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | DIV ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | COMMA ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, MenhirState075) in
          let _menhir_s = MenhirState111 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LIT _v ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT_LIT _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT_LIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL_LIT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | BOOL_EQUALS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | AND ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | RBRACE | RPAREN ->
          let x = _v in
          let _v = _menhir_action_082 x in
          _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_expression_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState111 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState153 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_112 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_COMMA -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_083 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_061 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let x = _v in
      let _v = _menhir_action_049 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState153 ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState045 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState080 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState065 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_154 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT, _menhir_box_main) _menhir_cell1_LBRACE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_001 xs in
          _menhir_goto_array_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_array_literal : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState217 ->
          _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState152 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_219 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_list_MODIFIER_ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_003 _1 _2 _3 _5 in
      _menhir_goto_classlevel_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_157 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_023 _1 _2 _4 in
      _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_118 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_typ (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_NEW (_menhir_stack, _menhir_s) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_015 _2 xs in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_primitive_type _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_021 _1 _3 xs in
          _menhir_goto_function_call _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_153 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TVOID ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | TSTRING ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | TOBJECT ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | TINT ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | TFLOAT ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | TCHAR ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | TBOOL ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | SWITCH ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | STRING_LIT _v ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState153
      | NOT ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | NEW ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | MINUS ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | LPAREN ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | INT_LIT _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState153
      | INCREMENT ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | IDENT _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState153
      | FLOAT_LIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState153
      | DECREMENT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | BOOL_LIT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState153
      | RBRACE ->
          let _v = _menhir_action_048 () in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_150 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LBRACKET ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ASSIGN_EQUALS ->
              let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
              let _menhir_s = MenhirState152 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | SWITCH ->
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING_LIT _v ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NOT ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NEW ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRACE ->
                  _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT_LIT _v ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | INCREMENT ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FLOAT_LIT _v ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DECREMENT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | BOOL_LIT _v ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | ENDLINE | RPAREN ->
              let (_1, _2) = (_v, _v_0) in
              let _v = _menhir_action_024 _1 _2 in
              _menhir_goto_incomplete_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_NEW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | SWITCH ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | STRING_LIT _v_0 ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState045
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | INT_LIT _v_1 ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState045
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | IDENT _v_2 ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState045
          | FLOAT_LIT _v_3 ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState045
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
          | BOOL_LIT _v_4 ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState045
          | RPAREN ->
              let _v_5 = _menhir_action_048 () in
              _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 _tok
          | _ ->
              _eRR ())
      | LBRACKET ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LBRACKET ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
              let _menhir_s = MenhirState029 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | RPAREN ->
              let (_1, _2) = (_v, _v_0) in
              let _v = _menhir_action_080 _1 _2 in
              _menhir_goto_separated_nonempty_list_COMMA___anonymous_0_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA___anonymous_0_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState211 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState023 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState029 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_033 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_047 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA___anonymous_0__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA___anonymous_0__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState211 ->
          _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState023 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_034 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_list_MODIFIER_, _menhir_box_main) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_0__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | TVOID ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | TSTRING ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | TOBJECT ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | TINT ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | TFLOAT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | TCHAR ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | TBOOL ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | SWITCH ->
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | STRING_LIT _v_0 ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState036
          | RETURN ->
              _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | NOT ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | NEW ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | MINUS ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | LBRACE ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | INT_LIT _v_1 ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState036
          | INCREMENT ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | IF ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | IDENT _v_2 ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState036
          | FOR ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | FLOAT_LIT _v_3 ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState036
          | DO ->
              _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | DECREMENT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | CONTINUE ->
              _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | BREAK ->
              _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | BOOL_LIT _v_4 ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState036
          | RBRACE ->
              let _v_5 = _menhir_action_040 () in
              _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_030 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_IDENT (_menhir_stack, _2_inlined1) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_081 _1 _2_inlined1 xs in
      _menhir_goto_separated_nonempty_list_COMMA___anonymous_0_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_063 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_primitive_type -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TVOID ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | TSTRING ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | TOBJECT ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | TINT ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | TFLOAT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | TCHAR ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | TBOOL ->
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | SWITCH ->
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | STRING_LIT _v_0 ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState065
              | NOT ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | NEW ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | MINUS ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | LPAREN ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | INT_LIT _v_1 ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState065
              | INCREMENT ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | IDENT _v_2 ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState065
              | FLOAT_LIT _v_3 ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState065
              | DECREMENT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
              | BOOL_LIT _v_4 ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState065
              | RPAREN ->
                  let _v_5 = _menhir_action_048 () in
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 _tok
              | _ ->
                  _eRR ())
          | AND | ARROW | BOOL_EQUALS | COLON | COMMA | DIV | DOT | ENDLINE | EOF | GREATER | GREATER_EQ | IDENT _ | LESS | LESS_EQ | MINUS | MOD | MODIFIER _ | NOT_EQUALS | OR | PIPE | PLUS | QUESTION_MARK | RBRACE | RPAREN | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TIMES | TINT | TOBJECT | TSTRING | TVOID ->
              let MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _1) = _menhir_stack in
              let _3 = _v in
              let _v = _menhir_action_016 _1 _3 in
              _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | DOT ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v) in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _ | LBRACKET | LPAREN ->
          let _1 = _v in
          let _v = _menhir_action_096 _1 in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MODIFIER _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000
      | IDENT _ | STRUCTURE _ | TBOOL | TCHAR | TFLOAT | TINT | TOBJECT | TSTRING | TVOID ->
          let _v = _menhir_action_036 () in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | EOF ->
          let _v = _menhir_action_038 () in
          _menhir_run_005 _menhir_stack _v _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
