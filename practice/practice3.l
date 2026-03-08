%{
#include<stdio.h>
int lowercase = 0;
%}
%%
[a-z]   { lowercase++; }
.       ;
%%
int main() {
    yylex();
    printf("Total lowercase letters: %d\n", lowercase);
    return 0;
}
int yywrap() { return 1; }