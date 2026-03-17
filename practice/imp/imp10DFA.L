%{
#include<stdio.h>
%}

%%

^b*a b*a b*$     printf("Valid string (exactly two a's): %s\n", yytext);

^[ab]+$          printf("Invalid string\n");

\n               ;

%%

int main()
{
    printf("Enter string:\n");
    yylex();
}

int yywrap()
{
    return 1;
}