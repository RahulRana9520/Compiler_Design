//Q3. LEX code to count braces, parentheses and punctuation
%{
#include <stdio.h>

int lc=0, rc=0, lp=0, rp=0, punc=0;
%}

%%
"{" { lc++; }
"}" { rc++; }
"(" { lp++; }
")" { rp++; }
[;,.] { punc++; }
. ;
%%

int main(){
yylex();

printf("Left Curly Braces: %d\n",lc);
printf("Right Curly Braces: %d\n",rc);
printf("Left Parenthesis: %d\n",lp);
printf("Right Parenthesis: %d\n",rp);
printf("Punctuation Symbols: %d\n",punc);

return 0;
}

int yywrap(){
return 1;
}