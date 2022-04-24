%{
	#include<stdio.h>
%}

%union{
	int dval;
}

%token <dval>NUMBER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type<dval> E

%%
S: E		{printf("Result: %d",$1);}
;
E:	E'+' E		{$$= $1+ $3;}
	| E'-' E	{$$= $1- $3;}
	| E'*' E	{$$= $1* $3;}
	| E'/' E	{$$= $1/ $3;}
;
%%

int main()
{
	printf("\n Enter expression:");
	yyparse();
	return 0;
}
