%{
	#include<stdio.h>
	int flag= 0;
%}

%token FOR OPBR CLBR SEMI REOP INC DEC ID NUM EQU OPCBR CLCBR 

%%
S: FOR OPBR E1 SEMI E2 SEMI E3 CLBR OPCBR CLCBR {printf("\n Accepted :) "); flag= 1;}
;
E1: ID EQU NUM| ID EQU ID
;
E2: ID REOP NUM| ID REOP ID
;
E3: ID INC| ID DEC
;
%%

int main()
{
	yyparse();
	if(flag== 0)
	{
		printf("\n Error in syntax!");
	}
	return 0;
}
