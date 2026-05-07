%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUM

%left '+' '-'
%left '*' '/'

%%

input:
        input line
      |
      ;

line:
      '\n'
    | E '\n'   { printf("Result = %d\n", $1); }
    ;

E:
      E '+' E   { $$ = $1 + $3; }
    | E '-' E   { $$ = $1 - $3; }
    | E '*' E   { $$ = $1 * $3; }
    | E '/' E   { $$ = $1 / $3; }
    | '(' E ')' { $$ = $2; }
    | NUM       { $$ = $1; }
    ;

%%

int main()
{
    printf("Desk Calculator\n");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}