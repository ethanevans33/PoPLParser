# PopL Parser Project
## Group Members:
Ethan Evans, Nick Sullivan, Joel Kampwerth, Philip Vincent
## Environment Setup
We used Visual Studio Code to create and edit our grammar .g4 files.
We also used Visual Studio Code to properly format the Python files used to test the grammar.
We used lab.antlr.org to test our grammar with each program deliverable as well as use the generated parse tree image it gave us to troubleshoot any issues with our grammar.
## Dependency
Our only true dependency was ANTLR since we used Python and were able to create our grammar without any additional dependencies.
## Overall Structure
1. "program" is the entry point of our grammar and it ends at "EOF"
2. Some of our top level assignments include if, while, and for and they become a child of the program tree.
3. We used "indentedBlock to handle all of the indentations
4. The expressions section handled:
parenthesized expressions, array literals, functionCall, Variable references, literal values, unary minus, binary arithmetic comparisons, and boolean logic.
5. Our tokens were keywords like if/elif, operators/punctuation, and layout stuff/comments (WS, NEWLINE, INDENT, LINE_COMMENT, BLOCK_COMMENT.


