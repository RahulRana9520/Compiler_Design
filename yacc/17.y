%{
    #include<stdio.h>
    #include<stdlib.h>

    void yyerror(const char *s);    //function used to handle syntax error
    int yylex();                    // function from lex , it is used by yacc to set tokens
%}

%token NUMBER                   // declares NULMBER as a token , this token received from lex

%%
STMT : EXPR '\n' {printf("valid expression");} //S->E
     ;
EXPR : EXPR '+' TERM
     | EXPR '-' TERM
     | TERM
     ;

TERM : TERM '*' FACTOR
     | TERM '/' FACTOR
     | FACTOR
     ;
FACTOR: NUMBER 
     ;
%%

void yyerror(const char *s){
    printf("sintax error : invalid arithmetic expresson"); 
}

int main(){
    printf("Enter your expression");
    yyparse();
    return 0;
}