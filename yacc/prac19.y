%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *msg);
%}

%token NUM

%left '+' '-'
%left '*' '/'

%%

S: E { printf("\n"); }
 ;

E: E '+' E { printf("+"); }
 | E '-' E { printf("-"); }
 | E '*' E { printf("*"); }
 | E '/' E { printf("/"); }
 | '(' E ')'
 | NUM { printf("%d", $1); }
 ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    printf("Error: %s\n", msg);
}