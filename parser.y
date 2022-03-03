%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE LLS ALS LRS ARS EXPONENT LB RB EQUALS
%token EOL

%%

calculation:
    | calculation bitManipulatedExp EOL {printf("> Result = %d\n\n> ",$2);}
    | calculation bitManipulatedExp EQUALS EOL {printf("> Result = %d\n\n> ", $2);}
    | calculation EOL {printf("\n\n> ");}
    ;

bitManipulatedExp: expression {$$=$1;}
                    | bitManipulatedExp ALS expression {$$ = $1<<$3;}
                    | bitManipulatedExp LLS expression {$$ = (unsigned)$1<<$3;}
                    | bitManipulatedExp ARS expression {$$ = $1>>$3;}
                    | bitManipulatedExp LRS expression {$$ = (unsigned)$1>>$3;}
                    ;

expression: term {$$ = $1;}
            | expression PLUS term {$$=$1+$3;}
            | expression MINUS term {$$=$1-$3;} 
            ;

term: factor {$$=$1;}
    | term DIVIDE factor {if($3==0){printf("Cannot divide by zero\n");exit(0);}$$=$1/$3;}
    | term MULTIPLY factor {$$=$1*$3;}
    ;

factor: unit
	| factor EXPONENT unit  {$$=(int)pow($1,$3);}
	;

unit: NUMBER
        | LB expression RB {$$ = $2;}
        | PLUS NUMBER {$$=$2;}
        | MINUS NUMBER {$$=-$2;}
        ;
%%

int yyerror(char *s){
  fprintf(stderr, "error: %s\n", s);
}
