%{
#include<stdio.h>
%}

keyword     int|float|char|double|if|else|while|return
identifier  [a-zA-Z_][a-zA-Z0-9_]*
number      [0-9]+
string      \"[^\"]*\"
literal     \'[^\']\'

%%

{keyword}      { printf("Keyword: %s\n",yytext); }
{identifier}   { printf("Identifier: %s\n",yytext); }
{number}       { printf("Constant: %s\n",yytext); }
{string}       { printf("String: %s\n",yytext); }
{literal}      { printf("Literal: %s\n",yytext); }

[ \t\n]        ;
.              ;

%%

int main()
{
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}