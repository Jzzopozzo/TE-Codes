%{
#include<stdio.h>
int flag=0;
//int yylex();
//int yyerror();
%}
%token FOR OPEN CLOSE SEMICOLON EQUAL INC DEC RELATION ID NUMBER
%%

S: FOR  OPEN E1 SEMICOLON E2 SEMICOLON E3 CLOSE {printf("For Loop Accepted"); flag=1;};

E1: ID EQUAL NUMBER
	| ID EQUAL ID;
E2: ID RELATION NUMBER
	| ID RELATION ID
	| ID RELATION EQUAL ID
	| ID RELATION EQUAL NUMBER
	;
E3: ID INC
	| ID DEC;
%%

int main()
{
	printf("\nEnter your expression : ");
	yyparse();
	
	if(flag==0)
		printf("\nError in for loop");
	//yyerror();
	
	return 0;
}
