%{
#include <stdio.h>

FILE *out;
%}

%%
#[A-Za-z0-9_]+  { fprintf(out,"%s\n",yytext); }
. ;
%%

int main(){
    out=fopen("output.txt","w");
    yyin=fopen("input.txt","r");

    yylex();

    fclose(out);
    return 0;
}

int yywrap(){
    return 1;
}