%{
#include <stdio.h>
#include <stdlib.h>   // needed for atoi
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t\r]+    ;   /* ignore whitespace (including CR) */
\r\n        { return '\n'; }
\n          { return '\n'; }

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
"/"         { return DIV; }

.           { printf("Invalid char: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}