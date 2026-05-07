%{
    #include<stdio.h>
%}
%S A B C DEAD
%%
<INITIAL>[0-9]+                BEGIN A;
<INITIAL>[0-9]+\.[0-9]+        BEGIN B;
<INITIAL>[a-zA-Z_][a-zA-Z0-9_]* BEGIN C;
<INITIAL>[^a-zA-Z0-9_\n.]      BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL;  {printf("Empty String..\n");}

<A>[^\n] BEGIN DEAD;
<A>\n BEGIN INITIAL;  {printf("Integer\n");}

<B>[^\n] BEGIN DEAD;
<B>\n BEGIN INITIAL;  {printf("float\n");}

<C>[^\n] BEGIN DEAD;
<C>\n BEGIN INITIAL;  {printf("Valid identifier\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL;  {printf("invalid\n");}
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