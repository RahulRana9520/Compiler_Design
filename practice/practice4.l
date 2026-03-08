%{
#include<stdio.h>
int special = 0;
%}
%%
[^a-zA-Z0-9\n\t ]   { special++; }
.       ;
%%
int main() {
    yylex();
    printf("Total special characters: %d\n", special);
    return 0;
}
int yywrap() { return 1; }