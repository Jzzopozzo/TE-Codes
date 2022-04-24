%{
	#include<"y.tab.h">
%}

digit [0-9]+
newline "\n"

%%
{digit} {
		yylval.dval= atoi(yytext);
		return NUMBER;
	}
	
{newline} {return 0;}
.	  {return yytext[0];}
%%
