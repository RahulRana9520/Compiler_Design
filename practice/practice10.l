%{
#include<stdio.h>
%}
%%
"//".*      ;
"/*"([^*]|\*+[^*/])*\*+"/"   ;
.           { printf("%s", yytext); }
\n          { printf("\n"); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }