%{
    #include<stdio.h>
    #include<stdlib.h>
    FILE *fpout;
%}

%%

"//".*                   { }

"/*"([^*]|\*+[^*/])*\*+"/"  { }
.                   { fprintf(fpout, "%s", yytext); }

\n                  { fprintf(fpout, "\n"); }

%%

int main()
{
    yyin = fopen("Inputing.txt", "r");      // Directly assign to yyin
    fpout = fopen("out.c", "w");
    if(yyin == NULL){
        printf("Cannot open Inputing.txt\n");
        exit(1);
    }
    yylex();

    fclose(yyin);
    fclose(fpout);
    printf("Comments removed successfully. Check out.c\n");
    return 0;
}

int yywrap()
{
    return 1;
}