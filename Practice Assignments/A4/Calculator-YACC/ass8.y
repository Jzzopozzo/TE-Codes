%{
#include<stdio.h>
%}
%union{
	int dval;
      }
%token<dval> NUMBER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type<dval> E    
%%
S:E		{printf("Result : %d\n",$1);}
E: E'+'E	{$$=$1+$3;}
  |E'-'E	{$$=$1-$3;}
  |E'*'E	{$$=$1*$3;}
  |E'/'E	{$$=$1/$3;}
  |'-'E		{$$=-$2;}
  |'('E')'	{$$=$2;}
  |NUMBER	{$$=$1;}
%%
