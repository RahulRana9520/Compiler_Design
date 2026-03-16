%{
    #include<stdio.h>
%}

%%
^[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)?@(gmail\.com|yahoo\.com|outlook\.com)      printf("this is a valid email\n");
.*                                                      printf("this is not a valid email\n");
%%

int main() {
    printf("Enter your email:");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}