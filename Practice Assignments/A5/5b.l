/*
TITLE: Assignment to implement positive closure of language: number of a equal to number of b.
*/
%{
	#include<stdio.h>
	int count=0;
%}

%%
"a" {count++;}
"b" {count--;}
"\n" {
	if(count==0)
		printf("Language Accepted!!");
	else
		printf("Unequal number of a's and b's");
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
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ lex 5b.l
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ ./a.out
Enter the Expression:	ababab
Language Accepted!!^Z
[2]+  Stopped                 ./a.out
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A5$ ./a.out
Enter the Expression:	aab
Unequal number of a's and b's

*/
