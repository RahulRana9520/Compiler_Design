%{
#include<stdio.h>
%}

%s q1 q2 DEAD

%%

<INITIAL>a BEGIN q1;
<INITIAL>b BEGIN DEAD;
<INITIAL>\n { printf("empty string\n"); }

<q1>a BEGIN q1;
<q1>b BEGIN q2;
<q1>\n { printf("rejected\n"); }

<q2>a BEGIN q1;
<q2>b BEGIN q2;
<q2>\n { printf("Accepted\n"); }

<DEAD>[ab] BEGIN DEAD;
<DEAD>\n { printf("rejected\n"); }

%%
int main()
{
    printf("enter the string:");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}