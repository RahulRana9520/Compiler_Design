%{
#include<stdio.h>
%}
%%
[0-9]+\.[0-9]+   { printf("Floating number\n"); }
[0-9]+            { printf("Integer number\n"); }
.                  ;
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }