/*
TITLE: Assignment to implement a parser that accepts the language L={1^n 0^n; where n>0}
*/

%{
	#include<stdio.h>
	int flag=0,count=0,middle_count=0;
%}

middle "10"
one "1"
zero "0"
check "\n"
%%
{middle} {	if(middle_count==0)		
			flag=1; 
		else				//if middle part occurs more than once
		{
			printf("Invalid Expression!!");
			exit(0);
		}		
		middle_count++;  
		//printf("Inside Middle");
	}
{one} {		count++; 
		if(flag==1)		//if one occurs after middle
		{
			printf("Invalid Expression!!");
			exit(0);
		}				
	}
{zero} {
		if(flag==1) 		//if zero occurs after middle
			count--;	
		else
		{
			printf("Invalid Expression!!");
			exit(0);	
		}
	}
{check} {
		if(count==0)
			printf("Language Accepted!!");
		else	
			printf("Invalid Expression!!");
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
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A7$ lex ass7.l
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A7$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A7$ ./a.out
Enter the Expression:	101010
Invalid Expression!!
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Astignments/A7$ ./a.out
Enter the Expression:	11110000
Language Accepted!!^Z
[13]+  Stopped                 ./a.out
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A7$ ./a.out
Enter the Expression:	110010
Invalid Expression!!
*/
