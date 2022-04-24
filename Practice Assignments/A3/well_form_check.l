/*
TITLE: Assignment to check whether given expression is well formed or not.
*/

%{
	#include<stdio.h>
	int para_count=0;
%}

exp [a-zA-Z]+
operate "+"|"-"|"*"|"/"
open "("|"{"
close ")"|"{"
check "\n"
%%
{operate} { }
{exp} { }
{open} {para_count++;}
{close} {para_count--;}
{check} {

	if(para_count==0)
		printf("Well-formed Paranthesis");
	else
		printf("Paranthesis Mismatch!!");
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
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A3$ lex well_form_check.l
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A3$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A3$ ./a.out
Enter the Expression:	((a+b)*(a-b))
Well-formed Paranthesis

*/
