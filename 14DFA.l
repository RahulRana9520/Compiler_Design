%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%s B C D DEAD

%%

<INITIAL>[a] BEGIN B;
<INITIAL>[b] BEGIN C;
<INITIAL>[^\nab] BEGIN DEAD;
<INITIAL>[\n] BEGIN INITIAL; {printf("accepted\n");}

<B>[a] BEGIN INITIAL;
<B>[b] BEGIN D;
<B>[^\nab] BEGIN DEAD;
<B>[\n] BEGIN INITIAL ; {printf("rejected\n");}

<C>[b] BEGIN INITIAL;
<C>[a] BEGIN D;
<C>[^\nab] BEGIN DEAD;
<C>[\n] BEGIN INITIAL ; {printf("rejected\n");}

<D>[a] BEGIN C;
<D>[b] BEGIN B;
<D>[^\nab] BEGIN DEAD;
<D>[\n] BEGIN INITIAL ; {printf("rejected\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>[\n] BEGIN INITIAL; {printf("invalid\n");}

%%

int main(){
    printf("enter your string (a,b):");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}


