%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
[ \t]+      { fprintf(yyout , " "); }
\n          { fprintf(yyout, "\n"); }          // if we ignore \n the output become a single large line
.           { fprintf(yyout, "%s", yytext); }
%%

int main()
{
    yyin = fopen("Input.txt", "r");           // Directly assign to yyin
    yyout = fopen("Output.txt", "w");

    if(yyin == NULL)
    {
        printf("Cannot open Input.txt\n");
        exit(1);
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("Processing completed. Check Output.txt\n");
    return 0;
}

int yywrap()
{
    return 1;
}