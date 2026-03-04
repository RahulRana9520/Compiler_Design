%{
#include <stdio.h>

int lpar = 0, rpar = 0;
int lcurly = 0, rcurly = 0;
int integer = 0, floating = 0;
int alphabet = 0;
%}

%%
"("             { lpar++; }
")"             { rpar++; }
"{"             { lcurly++; }
"}"             { rcurly++; }

[0-9]*\.[0-9]+  { floating++; }
[0-9]+          { integer++; }

[a-zA-Z]        { alphabet++; }

\n              ;
.               ;
%%

int main() {
    printf("Enter C program (Ctrl+D to end input):\n");
    yylex();

    printf("\n--- Count Result ---\n");
    printf("Left Parenthesis ( : %d\n", lpar);
    printf("Right Parenthesis ) : %d\n", rpar);
    printf("Left Curly Braces { : %d\n", lcurly);
    printf("Right Curly Braces } : %d\n", rcurly);
    printf("Integer Numbers   : %d\n", integer);
    printf("Floating Numbers  : %d\n", floating);
    printf("Alphabets         : %d\n", alphabet);

    return 0;
}

int yywrap() {
    return 1;
}
