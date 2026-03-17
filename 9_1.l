%{
#include<stdio.h>
FILE *yyin, *yyout;
%}

%%

\<[^>]+\>      fprintf(yyout,"%s\n",yytext);

.|\n           ;

%%

int main()
{
    yyin = fopen("index.html","r");   // existing HTML file
    yyout = fopen("output.txt","w");    // output file automatically created

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("All HTML tags extracted into tags.txt\n");

    return 0;
}

int yywrap()
{
    return 1;
}