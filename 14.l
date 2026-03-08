%{
#include<stdio.h>
#include<string.h>
%}

%%

[ab]+ {              //Matches one or more characters that are either 'a' or 'b'  Example matches: a, b, ab, aabbb, baab, etc.
    int a=0,b=0,i;

    for(i=0;i<strlen(yytext);i++)
    {
        if(yytext[i]=='a')
            a++;
        else if(yytext[i]=='b')
            b++;
    }

    if(a%2==0 && b%2==0)
        printf("%s is accepted\n",yytext);
    else
        printf("%s not accepted\n",yytext);
}

\n ;

%%

int main()
{
    printf("Enter strings:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}