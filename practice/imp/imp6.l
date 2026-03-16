%{
#include <stdio.h>

int keywords = 0, identifiers = 0, operators = 0;
%}

%%
"int"|"float"|"char"|"return"|"if"|"else"|"while"|"for"   { keywords++; }

[a-zA-Z_][a-zA-Z0-9_]*   { identifiers++; }

"+"|"-"|"*"|"/"|"="|"=="|"<"|">"|"<="|">="   { operators++; }

. ;
%%

int main()
{
    yyin = fopen("input.c", "r");   // directly assigning file to yyin

    yylex();

    printf("Keywords: %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);
    printf("Operators: %d\n", operators);

    return 0;
}

int yywrap()
{
    return 1;
}