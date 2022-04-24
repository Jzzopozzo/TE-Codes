/*
				

Write a program using YACC specifications to implement syntax analysis phase of compiler
to validate type and syntax of variable declaration in Java.
*/

%{
	#include<stdio.h>
	int flag=0;
%}

%token DATATYPE EQUAL SEMIC ID NUM		//declare tokens



%%
S:S1|S2;

S1:DATATYPE ID SEMIC
{
	printf("\n Correct syntax");
	flag=1;
};

S2: DATATYPE ID EQUAL NUM SEMIC
{
	printf("\n Correct syntax");
	flag=1;
};

%%

int main()
{
	yyparse();
}

yyerror()
{
	if(flag==0)
	printf("Error in Syntax");
}
yywrap()
{
	return 1;		//return 0- Scanning Continues else non-zero - scanning termninates
}

//OUTPUT
/*./a.out
int a ;
  
 Correct syntax
^Z
[6]+  Stopped                 ./a.out
unix@unix-HP-280-G1-MT:~$ lex jcheck.l
unix@unix-HP-280-G1-MT:~$ yacc -d jcheck.y
unix@unix-HP-280-G1-MT:~$ cc lex.yy.c y.tab.c -ll -ly

unix@unix-HP-280-G1-MT:~$ ./a.out
int a = 1 ;
    
 Correct syntax
*/


