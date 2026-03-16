/*
Q2. Replace IPv4 addresses by class name
IPv4 Class Ranges
Class	Range
A	1–126
B	128–191
C	192–223
D	224–239
E	240–255
LEX Code
*/

%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
([0-9]{1,3}\.){3}[0-9]{1,3} {
    int first;
    sscanf(yytext,"%d",&first);

    if(first>=1 && first<=126)
        printf("%s -> Class A\n",yytext);
    else if(first>=128 && first<=191)
        printf("%s -> Class B\n",yytext);
    else if(first>=192 && first<=223)
        printf("%s -> Class C\n",yytext);
    else if(first>=224 && first<=239)
        printf("%s -> Class D\n",yytext);
    else
        printf("%s -> Class E\n",yytext);
}
%%

int main(){
yylex();
return 0;
}

int yywrap(){
return 1;
}