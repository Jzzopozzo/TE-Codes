/*
TITLE: Assignment to implement a parser that accepts all strings that begin with "10".
*/

%{
	#include<stdio.h>
	int flag=0;
%}
%token START OTHER
%%
S: START {printf("Language Accepted!!"); flag=1;} | OTHER {flag=0;};
%%

int main()
{
	printf("Enter the Expression:\t");
	yyparse();
	return 0;
}

yyerror()
{
	if(flag==0)
		printf("Invalid Expression!!");
}

yywrap()
{
	return 1;
}

/*
OUTPUT:
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A6$ lex ass6.l
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A6$ yacc -d ass6.y
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A6$ cc lex.yy.c y.tab.c -ll -ly

akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A6$ ./a.out
Enter the Expression:	101010
Language Accepted!!
^Z
[4]+  Stopped                 ./a.out
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A6$ ./a.out
Enter the Expression:	01011101
Invalid Expression!!
*/
