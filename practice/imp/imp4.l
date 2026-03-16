Q1. LEX code to print lines containing an email address
%{
#include <stdio.h>
%}

%%
[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}   { printf("Email Found: %s\n", yytext); }
.* ;
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}