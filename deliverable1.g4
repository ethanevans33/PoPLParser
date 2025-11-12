grammar deliverable1;

// Parser
program
    : statement* EOF
    ;

statement
    : assignment
    | compoundAssignment
    ;

assignment
    : ID '=' expr
    ;

compoundAssignment
    : ID ('+=' | '-=' | '*=' | '/=') expr
    ;

// Expressions
expr
    : '(' expr ')'
    | array
    | ID
    | literal
    | expr ('*' | '/' | '%') expr
    | expr ('+' | '-') expr
    ;

array
    : '[' (expr (',' expr)*)? ']'
    ;

// Literals
literal
    : INT
    | FLOAT
    | STRING
    | BOOL
    ;

// Lexer
ID      : [a-zA-Z_][a-zA-Z0-9_]* ;
INT     : [0-9]+ ;
FLOAT   : [0-9]+ '.' [0-9]+ ;
STRING
    : '"' (~["\\\r\n] | '\\' . )* '"'   // double-quoted string
    | '\'' (~['\\\r\n] | '\\' . )* '\'' // single-quoted string
    ;
BOOL    : 'True' | 'False' ;

// Operators and symbols
PLUS    : '+' ;
MINUS   : '-' ;
MULT    : '*' ;
DIV     : '/' ;
MOD     : '%' ;
ASSIGN  : '=' ;
PLUSEQ  : '+=' ;
MINUSEQ : '-=' ;
MULTEQ  : '*=' ;
DIVEQ   : '/=' ;
LPAREN  : '(' ;
RPAREN  : ')' ;
LBRACK  : '[' ;
RBRACK  : ']' ;
COMMA   : ',' ;

// Whitespace and newlines
WS      : [ \t\r\n]+ -> skip ;