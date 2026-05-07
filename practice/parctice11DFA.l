//start with different symbol and end with different symbol the sting contain {a,b,c};

%{
#include <stdio.h>
%}

%s A B C DEAD

%%

/* ---------- INITIAL STATE ---------- */
<INITIAL>a      { BEGIN(A); }
<INITIAL>b      { BEGIN(B); }
<INITIAL>c      { BEGIN(C); }
<INITIAL>[^abc\n] { BEGIN(DEAD); printf("Invalid string\n"); }

/* ---------- STATE A ---------- */
<A>a            { BEGIN(A); }
<A>b            { BEGIN(A); }
<A>c            { BEGIN(A); }
<A>\n           { printf("Rejected: start and end are same (a)\n"); BEGIN(INITIAL); }
<A>[^abc\n]     { BEGIN(DEAD); printf("Invalid string\n"); }

/* ---------- STATE B ---------- */
<B>a            { BEGIN(B); }
<B>b            { BEGIN(B); }
<B>c            { BEGIN(B); }
<B>\n           { printf("Rejected: start and end are same (b)\n"); BEGIN(INITIAL); }
<B>[^abc\n]     { BEGIN(DEAD); printf("Invalid string\n"); }

/* ---------- STATE C ---------- */
<C>a            { BEGIN(C); }
<C>b            { BEGIN(C); }
<C>c            { BEGIN(C); }
<C>\n           { printf("Rejected: start and end are same (c)\n"); BEGIN(INITIAL); }
<C>[^abc\n]     { BEGIN(DEAD); printf("Invalid string\n"); }

/* ---------- DEAD STATE ---------- */
<DEAD>[^\n]*    { /* stay here */ }
<DEAD>\n        { BEGIN(INITIAL); }

%%

int main() {
    printf("Enter string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}