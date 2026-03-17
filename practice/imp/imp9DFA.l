%{
#include<stdio.h>
%}

%%

^[ab]{1,2}$     printf("Valid string (length at most 2): %s\n",yytext);

^[ab]+$         printf("Invalid string\n");

\n              ;

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