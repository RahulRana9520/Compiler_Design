%{
#include <stdio.h>

int chars = 0;
int words = 0;
int spaces = 0;
%}

%%

[ ]+        { spaces += yyleng; chars += yyleng; }   //match (+ means "one or more space") //yyleng = length of matched text
\n          { chars++; }                             //Matches a newline character
\t          { spaces++; chars++; }                  //Matches a tab

[A-Za-z0-9]+    { words++; chars += yyleng; }

.           { chars++; }

%%

int yywrap() {    //Called when end-of-file is reached
    return 1;     //" return 1 mean stop scanning . no more input".
}

int main() {
    yyin = fopen("Input.txt", "r");     //yyin is a LEX global file pointer
    if (yyin == NULL) {
        printf("Cannot open file\n");
        return 1;
    }

    yylex();                         //Starts the lexical analyzer

    printf("The number of total characters in the given input file is: %d\n", chars);
    printf("The number of total words in the given input file is: %d\n", words);
    printf("The number of total white spaces in the given input file is: %d\n", spaces);

    fclose(yyin);
    return 0;
}
