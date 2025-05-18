%{
#include <iostream>
#include <string>
#include <stdlib.h>

extern int yylex (void);
void yyerror(const char *s);
extern FILE *yyin;

%}

%union {
    int number;
}

%token <number> NUMBER

%token PLUS

%type <number> program expr

%left PLUS

%start program


%%

program:
    expr                { printf("%d\n", $1); }
    ;

expr:
      NUMBER            { $$ = $1; }
    | expr PLUS expr    { $$ = $1 + $3; }   
    ;

%%


void yyerror(const char *s){
    printf("Error: %s\n", s);
}

int main(int argc, char **argv){
    if (argc > 1) yyin = fopen(argv[1], "r");
    else yyin = stdin;
    yyparse();
    return 0;
}