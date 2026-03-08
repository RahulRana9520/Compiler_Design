%{
#include<stdio.h>
#include<stdlib.h>

FILE *fpout;
%}

%%
[ \t]+      { fprintf(fpout, " "); }
\n          { fprintf(fpout, "\n"); }          // if we ignore \n the output become a single large line
.           { fprintf(fpout, "%s", yytext); }
%%

int main()
{
    yyin = fopen("Input.txt", "r");           // Directly assign to yyin
    fpout = fopen("Output.txt", "w");

    if(yyin == NULL)
    {
        printf("Cannot open Input.txt\n");
        exit(1);
    }

    yylex();

    fclose(yyin);
    fclose(fpout);

    printf("Processing completed. Check Output.txt\n");
    return 0;
}

int yywrap()
{
    return 1;
}