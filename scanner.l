%option noyywrap
%{
#include "parser.tab.h"
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
[0-9]+    {yylval = atoi(yytext); return NUMBER;}
"+"         {return PLUS;}
"-"         {return MINUS;}
"*"         {return MULTIPLY;}
"/"         {return DIVIDE;}
"<<"        {return ALS;}
"<<<"       {return LLS;}
">>"        {return ARS;}
">>>"       {return LRS;}
"^"         {return EXPONENT;}
"="         {return EQUALS;}
"("         {return LB;}
")"         {return RB;}
\n          {return EOL;}
[ \t]+       {   }
"exit"      {printf("Closing Calculator...\n");exit(0);}
.          {yyerror("Invalid Syntax\n");}
%%
