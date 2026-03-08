%{
#include<stdio.h>
%}
%%
[a-zA-Z_][a-zA-Z0-9_]*   { printf("Valid identifier\n"); }
.                         { printf("Invalid identifier\n"); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }