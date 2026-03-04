%{
#include <stdio.h>

int t_line = 0;
int t_space = 0;
int t_tab = 0;
int r_char = 0;
%}

%%
\n      { t_line++; }          /* count new lines */
" "     { t_space++; }         /* count spaces */
\t      { t_tab++; }           /* count tabs */
.       { r_char++; }          /* all other characters */
%%

int main() {
    printf("Enter your string (Ctrl+D to end input):\n");
    yylex();
    printf("The total number of lines: %d\n", t_line);
    printf("The total number of spaces: %d\n", t_space);
    printf("The total number of tab characters: %d\n", t_tab);
    printf("The rest of the characters: %d\n", r_char);
    return 0;
}

int yywrap() {
    return 1;
}