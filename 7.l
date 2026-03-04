%{
#include<stdio.h>
#include<stdlib.h>

FILE *fpout;
%}

%%
[ \t]+      { fprintf(fpout, " "); }
\n          { fprintf(fpout, "\n"); }
.           { fprintf(fpout, "%s", yytext); }
%%

int main()
{
    FILE *fpin;

    fpin = fopen("Input.txt", "r");
    fpout = fopen("Output.txt", "w");

    if(fpin == NULL)
    {
        printf("Cannot open Input.txt\n");
        exit(1);
    }

    yyin = fpin;
    yylex();

    fclose(fpin);
    fclose(fpout);

    printf("Processing completed. Check Output.txt\n");
    return 0;
}

int yywrap()
{
    return 1;
}
