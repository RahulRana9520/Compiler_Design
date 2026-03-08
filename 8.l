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
    FILE *fpin;
    fpin = fopen("Inputing.txt", "r");
    fpout = fopen("out.c", "w");
    if(fpin == NULL){
        printf("Cannot open Input.txt\n");
        exit(1);
    }
    yyin = fpin;
    yylex();

    fclose(fpin);
    fclose(fpout);
    printf("Comments removed successfully. Check out.c\n");
    return 0;
}

int yywrap()
{
    return 1;
}

