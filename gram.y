%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "func.h"
#include "y.tab.h"

extern int yylex(void);
extern void yyterminate();
void yyerror(const char *s);

%}

%union {
	double num;
}

%token<num> NUMBER
%token<num> SQRT
%token<num> LOG2 LOG10
%token<num> COS SIN TAN 

%type<num> line
%type<num> calculation
%type<num> expr
%type<num> term
%type<num> exp
%type<num> function
%type<num> factor
%type<num> log_function
%type<num> trig_function


%%
program:	program line
			|
			;
	
line:  calculation '\n'  { printf("=%.2f\n",$1); }
		;

calculation:	 expr
				| function
				;
		
expr:	term	
		| expr '++'		{ $$ = $1 + 1; }
		| expr '--'		{ $$ = $1 - 1; }
		| expr '+' term		{ $$ = $1 + $3; } 
		| expr '-' term		{ $$ = $1 - $3; } 
		| '-' term 			{ $$ = - $2; } 
		;
		
term: 	exp 	
		| term '*' exp 		{ $$ = $1 * $3; } 
		| term '/' exp		{ if ($3 == 0) { yyerror("Cannot divide by zero"); exit(1);} else $$ = $1 / $3; } 
		;
		
exp:	factor	
		| exp '^' factor 	{ $$ = pow($1,$3); }
		| exp '%' factor	{ $$ = modulo($1, $3);}
		;
		
function: 	log_function
			| trig_function
			| SQRT '(' expr ')'  {  $$ = sqrt($3);}
			| expr '!'			{ $$ = factorial($1);}
			;
			
factor:		NUMBER  { $$ = $1; }
			| '(' expr ')'   { $$ = $2; }
			;
			
trig_function:	COS expr  			  { $$ = cos($2); }
				| SIN expr 				{ $$ = sin($2); }
				| TAN expr 				{ $$ = tan($2); }
				;
	
log_function:	LOG2 '(' expr ')'		{ $$ = log2($3); }
				| LOG10 '(' expr ')'	{ $$ = log10($3); }
				;

%%


int main()
{
 printf("Please enter a calculation:\n"); 
	yyparse();
	return 0;
}


void yyerror(const char *s)
{
	printf("ERROR: %s\n", s);
}
