%{
	#include "y.tab.h"
	extern int yylval;
%}

%%
"for" {return(FOR);}
"(" {return(OPBR);}
")" {return(CLBR);}
"{" {return(OPCBR);}
"}" {return(CLCBR);}
";" {return(SEMI);}
"=" {return(EQU);}
"<"|">"|"<="|">=" {return (REOP);}
"++" {return(INC);}
"--" {return(DEC);}
[a-z|A-Z]+ {yylval= yytext[0]; return (ID);}
[0-9]+ {yylval= atof(yytext); return (NUM);}
%%
