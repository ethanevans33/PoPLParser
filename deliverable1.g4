grammar deliverable2;

// Parser
program
    : statement* EOF
    ;

// Added new statement types for if/elif/else
statement
    : assignment
    | compoundAssignment
    | ifHeader
    | elifHeader
    | elseHeader
    ;

assignment
    : ID '=' expr
    ;

compoundAssignment
    : ID ('+=' | '-=' | '*=' | '/=') expr
    ;

ifHeader
    : IF expr COLON
    ;

elifHeader
    : ELIF expr COLON
    ;

elseHeader
    : ELSE COLON
    ;

// Expressions
expr
    : '(' expr ')'
    | array
    | ID
    | literal
    | '-' expr //For negatives
    | expr ('*' | '/' | '%') expr
    | expr ('+' | '-') expr
    | expr ( '<' | '<=' | '>' | '>=' | '==' | '!=' ) expr
    | expr AND expr
    | expr OR expr
    | NOT expr
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

// Keywords
IF      : 'if' ;
ELIF    : 'elif' ;
ELSE    : 'else' ;
AND     : 'and' ;
OR      : 'or' ;
NOT     : 'not' ;

BOOL    : 'True' | 'False' ;

ID      : [a-zA-Z_][a-zA-Z0-9_]* ;
INT     : [0-9]+ ;
FLOAT   : [0-9]+ '.' [0-9]+ ;
STRING
    : '"' (~["\\\r\n] | '\\' . )* '"'   // double-quoted string
    | '\'' (~['\\\r\n] | '\\' . )* '\'' // single-quoted string
    ;

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
// Additional ones
LE      : '<=' ;
GE      : '>=' ;
EQEQ    : '==' ;
NEQ     : '!=' ;
LT      : '<' ;
GT      : '>' ;
COLON   : ':' ;

// Whitespace and newlines
WS      : [ \t\r\n]+ -> skip ;