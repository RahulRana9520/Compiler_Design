%{
#include<stdio.h>
%}

%x A B C D

%%

\n { printf("Empty String Accepted\n"); }   

<INITIAL>[ab] { BEGIN A; yyless(0); }

<A>a BEGIN D;
<D>a BEGIN A;
<B>a BEGIN C;
<C>a BEGIN B;

<A>b BEGIN B;
<B>b BEGIN A;
<D>b BEGIN C;
<C>b BEGIN D;

<A>[^ab\n] BEGIN C;
<B>[^ab\n] BEGIN C;
<C>[^ab\n] BEGIN C;
<D>[^ab\n] BEGIN C;

<A>\n { printf("Accepted\n"); BEGIN INITIAL; }
<B>\n { printf("Not Accepted\n"); BEGIN INITIAL; }
<C>\n { printf("Not Accepted\n"); BEGIN INITIAL; }
<D>\n { printf("Not Accepted\n"); BEGIN INITIAL; }

%%

int main()
{
    printf("Enter string:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}