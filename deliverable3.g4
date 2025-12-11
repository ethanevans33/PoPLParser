grammar deliverable3;

// Parser
program
    : (statement NEWLINE*)* EOF
    ;

indentedBlock
    : (INDENT innerStatement)+
    ;

statement
    : assignment NEWLINE*
    | compoundAssignment NEWLINE*
    | ifBlock
    | whileBlock
    | forBlock
    ;

innerStatement
    : assignment NEWLINE*
    | compoundAssignment NEWLINE*
    | ifBlock
    | whileBlock
    | forBlock
    ;

ifBlock
    : IF expr COLON NEWLINE indentedBlock
      (INDENT* elifBlock)*
      (INDENT* elseBlock)?
    ;

elifBlock
    : ELIF expr COLON NEWLINE indentedBlock
    ;

elseBlock
    : ELSE COLON NEWLINE indentedBlock
    ;

assignment
    : ID '=' expr
    ;

compoundAssignment
    : ID ('+=' | '-=' | '*=' | '/=') expr
    ;

whileBlock
    : WHILE expr COLON NEWLINE indentedBlock
    ;

forBlock
    : FOR ID IN expr COLON NEWLINE indentedBlock
    ;

// Expressions
expr
    : '(' expr ')'
    | array
    | functionCall
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

functionCall
    : ID '(' (expr (',' expr)*)? ')'
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
WHILE   : 'while' ;
FOR     : 'for' ;
IN      : 'in' ;
AND     : 'and' ;
OR      : 'or' ;
NOT     : 'not' ;

BOOL    : 'True' | 'False' ;

ID      : [a-zA-Z_][a-zA-Z0-9_]* ;
INT     : [0-9]+ ;
FLOAT   : [0-9]+ '.' [0-9]+ ;
STRING
    : '"' (~["\\\r\n] | '\\' . )* '"'
    | '\'' (~['\\\r\n] | '\\' . )* '\''
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
WS      : [ ]+ -> skip ;

LINE_COMMENT
    : '#' ~[\r\n]* -> skip
    ;

BLOCK_COMMENT
    : '\'\'\'' .*? '\'\'\'' -> skip
    ;

NEWLINE	: '\r'? '\n' ;

INDENT  : '\t'+ ;
