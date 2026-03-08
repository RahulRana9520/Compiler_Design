%{
    #include<stdio.h>
%}

%%
[0-9]+            {printf("This is the integer no.");}
[0-9]*.[0-9]+   {printf("this is the flotting no.");}     //after . we want any no. not zero , to make it floting interger.
.*              {printf("no the valid integer.");}     
%%

int main(){
    printf("Enter any number you want to check:");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}