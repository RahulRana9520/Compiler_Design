%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER 

%left PLUS MINUS
%left MUL DIV

%%

input:
            /* empty */
        | input expr '\n'  { printf("Result = %d\n", $2); }
        ;

expr:
      expr PLUS expr   { $$ = $1 + $3; }
    | expr MINUS expr  { $$ = $1 - $3; }
    | expr MUL expr    { $$ = $1 * $3; }
    | expr DIV expr    {
                          if($3 == 0){
                              printf("Divide by zero error\n");
                              exit(0);
                          }
                          $$ = $1 / $3;
                      }
    | NUMBER           { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    printf("Invalid Expression\n");
}

int main() {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}