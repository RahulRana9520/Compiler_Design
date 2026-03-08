/* C Declarations Section - Code copied directly to generated C file */
%{
#include<stdio.h>   // Standard I/O library for file operations
#include<stdlib.h>  // Standard library for exit() function

FILE *fpout;        // Global file pointer for output file
%}

/* Rules Section - Pattern-Action pairs for lexical analysis */
%%
/* Pattern: One or more spaces or tabs */
/* Action: Replace consecutive whitespace with single space */
[ \t]+      { fprintf(fpout, " "); }

/* Pattern: Newline character */
/* Action: Preserve newlines in output */
\n          { fprintf(fpout, "\n"); }

/* Pattern: Any other single character (except newline) */
/* Action: Copy character as-is to output */
.           { fprintf(fpout, "%s", yytext); }
%%

/* User Code Section - Main program and auxiliary functions */
int main()
{
    FILE *fpin;  // File pointer for input file

    // Open input and output files
    fpin = fopen("Input.txt", "r");   // Open Input.txt for reading
    fpout = fopen("Output.txt", "w"); // Open Output.txt for writing

    // Check if input file opened successfully
    if(fpin == NULL)
    {
        printf("Cannot open Input.txt\n");
        exit(1);  // Exit with error status
    }

    yyin = fpin;  // Set Lex input stream to read from file
    yylex();      // Call lexical analyzer to process input

    // Close both files
    fclose(fpin);
    fclose(fpout);

    printf("Processing completed. Check Output.txt\n");
    return 0;  // Return success status
}

/* yywrap() - Required by Lex to handle end of input */
/* Returns 1 to indicate no more files to process */
int yywrap()
{
    return 1;  // Signal end of input
}
