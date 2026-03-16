%{
    #include<stdio.h>
%}

%%

^a[ab]*b$     {printf("%s is a accepted string\n",yytext);}
.*            {printf("%s is not accepted\n",yytext);}

%%

int main(){
    printf("enter the string (for output Ctrl+D):");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}