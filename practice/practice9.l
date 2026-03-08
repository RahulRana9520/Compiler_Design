%{
#include<stdio.h>
int words = 0;
%}
%%
[a-zA-Z]+   { words++; }
[ \t\n]    ;
.           ;
%%
int main() {
    yylex();
    printf("Total words: %d\n", words);
    return 0;
}
int yywrap() { return 1; }