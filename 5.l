%{
#include <stdio.h>
%}

/* Definitions */
KEYWORD     int|float|char|double|if|else|while|for|return
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
NUMBER      [0-9]+
OPERATOR    "="|"+"|"-"|"*"|"/"
SEPARATOR   ","|";"|"("|")"|"{"|"}"

%%

{KEYWORD}      { printf("%s is a keyword.\n", yytext); }
{IDENTIFIER}   { printf("%s is an identifier.\n", yytext); }
{NUMBER}       { printf("%s is a constant.\n", yytext); }
{OPERATOR}     { printf("%s is an operator.\n", yytext); }
{SEPARATOR}    { printf("%s is a separator.\n", yytext); }

[ \t\n]+       ;   /* ignore whitespace */
.              ;   /* ignore unknown characters */

%%

int main() {
    yylex();
    return 0;
}


int yywrap() {
    return 1;
}
