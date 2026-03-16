%{
#include<stdio.h>
%}

DIGIT   [0-9]
LETTER  [a-zA-Z]

%%

{DIGIT}+\.{DIGIT}+        { printf("%s is a FLOAT constant\n", yytext); }

{DIGIT}+                  { printf("%s is an INTEGER\n", yytext); }

{LETTER}({LETTER}|{DIGIT})*   { printf("%s is an IDENTIFIER\n", yytext); }

[ \t\n]+                  ;

.                         { printf("%s is INVALID\n", yytext); }

%%

int main()
{
    printf("Enter input (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}