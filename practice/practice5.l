%{
#include<stdio.h>
%}
%%
"if"     { printf("Keyword: if\n"); }
"else"   { printf("Keyword: else\n"); }
[a-zA-Z]+ { printf("Identifier: %s\n", yytext); }
.         ;
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }