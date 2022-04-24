%{
#include "y.tab.h"
%}
digit 	[0-9]*
newline "\n"
%%
{digit} 	{
			yylval.dval=atoi(yytext);
			return NUMBER;
		}   	
{newline} 	{return 0;}
.	{return yytext[0];}  
%%
int main()
{
	printf("\nEnter your expression : ");
	yyparse();
	return 0;
}
/*
OUTPUT:
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Calculator-YACC$ lex ass8.l
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Calculator-YACC$ yacc -d ass8.y 
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Calculator-YACC$ cc lex.yy.c y.tab.c -ll -ly
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Calculator-YACC$ ./a.out

Enter your expression : 2+3
Result : 5

*/
