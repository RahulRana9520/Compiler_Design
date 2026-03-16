//Q1. LEX code to implement DFA over Σ = {a,b} (length ≥ 3)
%{
#include <stdio.h>
%}

%%
(a|b){3,}   { printf("Valid string\n"); }
[^ab\n]+    { printf("Invalid input: only a and b allowed\n"); }  //mean not ab or new line
\n          ;
%%

int main() {
    printf("Enter string:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}