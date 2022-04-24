%{
#include "y.tab.h"
extern int yylval;
%}

char [a-zA-Z]+
num [0-9]+
open "("
close ")"
semicolon ";"
equal "="
increment "++"
decrement "--"
fr "for"
relation ["<"|">"|"<="|">="]
%%
{fr} { return FOR;}
{num} 	{
			yylval=yytext;return(NUMBER);
		}   	
{char} 	{ yylval=yytext[0];return(ID);}
{open} {return(OPEN);}
{close} {return(CLOSE);}
{semicolon} {return (SEMICOLON);}
{equal} {return (EQUAL);}
{increment} {return(INC);}
{decrement} {return (DEC);}
{relation} {return (RELATION);}
%%
