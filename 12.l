%{
#include<stdio.h>

int vowels = 0;
int consonants = 0;
%}

%%
[aAeEiIoOuU]      { vowels++; }
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]   { consonants++; }
\n                ;                 //if we not write these rule the string with new line give warning or error 
[ \t]             ;
.                 ;
%%

int main()
{
    printf("Enter a string:\n");
    yylex();

    printf("\nTotal number of Vowels are: %d\n", vowels);
    printf("Total number of Consonants are: %d\n", consonants);

    return 0;
}

int yywrap()
{
    return 1;
}
