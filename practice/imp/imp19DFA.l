%{
#include<stdio.h>
%}

%%

[01]+ {

    int rem = 0;

    for(int i=0; yytext[i] != '\0'; i++)
    {
        rem = (rem * 2 + (yytext[i]-'0')) % 3;
    }

    if(rem == 0)
        printf("Divisible by 3 : %s\n", yytext);
    else
        printf("Not divisible by 3 : %s\n", yytext);
}

\n ;

%%

int main()
{
    printf("Enter binary numbers:\n");
    yylex();
}

int yywrap()
{
    return 1;
}