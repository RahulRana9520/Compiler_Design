%{
#include<stdio.h>
#include<stdlib.h>

FILE *fp;
%}

%%

\<[^>]*\>  { fprintf(fp,"%s\n",yytext); }   // Match and print HTML tags

.|\n        ;                               // Ignore everything else

%%

int main()
{
    char inputname[50], fname[50];
    printf("Enter input file name: ");
    scanf("%s", inputname);

    printf("Enter output file name: ");
    scanf("%s", fname);

    yyin = fopen(inputname, "r");           // Open input HTML file
    if (yyin == NULL) {
        printf("Cannot open input file.\n");
        exit(1);
    }

    fp = fopen(fname, "w");                 // Open output file
    if (fp == NULL) {
        printf("Cannot open output file.\n");
        fclose(yyin);
        exit(1);
    }

    yylex();                                // Start lexical analysis

    fclose(yyin);
    fclose(fp);
    return 0;
}

int yywrap()
{
    return 1;
}