//dfa string starting with a

%{
#include<stdio.h>
%}

%%
^a[a|b]*     { printf("Accepted: String starts with a\n"); }
.*           { printf("Rejected: String does not start with a\n"); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter string: ");
    yylex();
    return 0;
}