%{
#include <stdio.h>
%}

%%

^[0-9]*[02468]$    printf("The number is even\n");
^[0-9]*[13579]$    printf("The number is odd\n");
.*                 printf("Invalid number\n");

%%

int main() {
    printf("Enter the number (to find even or odd): ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
