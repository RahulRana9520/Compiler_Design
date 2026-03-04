%{
#include<stdio.h>
%}
%%
^[a-z A-z][a-z A-Z 0-9 _ ]*   {printf("this is a valid identifier\n");}
.*                            {printf("this is not a valid identifier\n");}
%%
int main(){
char input[100];
    printf("Enter your variable string:");
    scanf("%s",input);
    yy_scan_string(input);
    yylex();      //yylex predifen functon call the  lex  ,it takes the input and it will pass the input to the rule section for pattern matching 
    return 0;
}

int yywrap(){    //it is a predefine function call by lex tools , this function used to check whether the string exausted or not ,if it is over , if it is over it return 1 otherwise 0
    return 1;
}
