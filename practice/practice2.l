%{
#include<stdio.h>
int uppercase = 0;
%}
%%
[A-Z]   { uppercase++; }
.       ;
%%
int main() {
    yylex();
    printf("Total uppercase letters: %d\n", uppercase);
    return 0;
}
int yywrap() { return 1; }