/*
TITLE: Assignment to implement positive closure of language: (10)+
*/

%{
	#include<stdio.h>
	int flag=0;
%}

lang "10"+
one "1"
zero "0"
check "\n"
%%
{one} {flag=0;}
{zero} {flag=0;}
{lang} {flag=1;}
{check} {
	if(flag==1)
	printf("Language Accepted!!");
	else
		printf("Invalid Expression");
}
%%

int main()
{
	printf("Enter the Expression:\t");
	yylex();
	return 0;
}
/*
OUTPUT:
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ lex 5a.l
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ ./a.out
Enter the Expression:	101010
Language Accepted!!
^Z
[11]+  Stopped                 ./a.out
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ ./a.out
Enter the Expression:	10101
Invalid Expression
*/
