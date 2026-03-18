%{
    #include<stdio.h>
%}
%S A B C DEAD
%%
<INITIAL>[0-9]+ BEGIN A;
<INITIAL>[0-9]*[.][0-9]+ BEGIN B;
<INITIAL>^[a-zA-Z_][a-zA-Z0-9_]+ BEGIN C;
<INITIAL>[^.*|\n] BEGIN DEAD;
<INITIAL>\n  BEGIN INITIAL; {printf("empty string\n");}
<A>^\n BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("integer number\n");}
<B>^\n BEGIN DEAD;
<B>\n BEGIN INITIAL ; {printf("float number\n");}
<C>^\n BEGIN DEAD;
<C>\n BEGIN INITIAL ; {printf("identifier\n");}
<DEAD>^\n BEGIN DEAD;
<DEAD>\n BEGIN INITIAL;{printf("invalid\n");}
%%
int main(){
    printf("enter the string:\n");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}
