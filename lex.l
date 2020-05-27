%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "y.tab.h"
%}

%%
[ \t]
[0-9]+(\.[0-9]+)?          					{ yylval.num = atof(yytext); return NUMBER; }
"+"      {return *yytext;}
"++"		{return *yytext;}
"--"      {return *yytext;}
"-"    {return *yytext;}
"*"   {return *yytext; }
"/"    {return *yytext; }
"("		{return *yytext;}
")"     {return *yytext;}
"^"    {return *yytext;}
"%"    {return *yytext;}
"!"		{return *yytext;}
("cos")|("COS")												{ return COS; }
("sin")|("SIN")												{ return SIN; }
("tan")|("TAN")												{ return TAN; }
("sqrt")|("SQRT")											{ return SQRT; }
("log2")|("LOG2")											{ return LOG2; }
("log10")|("LOG10")										{ return LOG10; }

[\n]                        					{return *yytext;}
. 																		{ yyerror("Undefined symbol"); exit(1); } 
%%

int yywrap(void)
{
	return 1;
}