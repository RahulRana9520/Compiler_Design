%{
    #include<stdio.h>
%}

%%

^[a-zA-Z0-9]+@[gmail\.com|outlook\.com|yahoo\.com]\n      printf("this is a valid email\n");
^[a-zA-Z0-9]+[.][a-zA-Z]+@(gmail\.com|outlook\.com|yahoo\.com)\n      printf("this is a valid email\n");
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