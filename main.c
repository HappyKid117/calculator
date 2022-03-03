#include "parser.tab.h"
int main(int argc, char **argv  ){
    printf("**************** CALCULATOR ****************\n\n");
    printf("> Addition : +\n> Subtraction : -\n> Multiplication : *\n> Division : /\n> Exponent : ^\n> Logical shifts : >>> <<<\n> Arithmetic shifts : >> <<\n");
    printf("> Parenthesis and precedence exist\n");
    printf("> Type \"exit\" to close the calculator\n\n");
    printf("**************** 2019A7PS0021G ****************\n\n> ");
    yyparse();
    return 0;
}
