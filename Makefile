build:	
	@ bison -vd parser.y
	@ flex scanner.l
	@ gcc -o calculator main.c parser.tab.c lex.yy.c -lfl -lm -w

run: build
	@./calculator

clean:
	@ rm calculator lex.yy.c parser.tab.c parser.tab.h parser.output
	
	
	
