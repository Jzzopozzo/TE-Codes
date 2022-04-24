/*
TEB-02 
TITLE: Write a program to implement calculator functions using LEX.
*/
%{
	#include<stdio.h>
	#include<string.h>
	#include<math.h>
	int f1=0,f2=0,op1,op2,trig_flag=0;
	char operate,tr;
	char trig_fun[50];
%}

operand [0-9]+
trigo "sin"|"cos"|"tan"|"cot"|"sec"|"cosec"
operator "+"|"-"|"/"|"*"
newline "\n"
%%
{operand} {
			if(trig_flag==0)
			{
			
				if(f1==0)
				{
					op1=atoi(yytext);
					f1=1;
				}
				else if(f2==0)
				{
					op2=atoi(yytext);
					f2=1;
				}
			
			}
			/*else
			{	
				if(strcmp(yytext,"sin")==0)
				{
					tr='1';
				}
				
				else if(strcmp(trig_fun,"cos")==0)
				{
					tr='2';
				}
				else if(strcmp(trig_fun,"tan")==0)
				{
					tr='3';
				}
				else if(strcmp(trig_fun,"cot")==0)
				{
					tr='4';
				}
				else if(strcmp(trig_fun,"sec")==0)
				{
					tr='5';
				}
				else if(strcmp(trig_fun,"cosec")==0)
				{
					tr='6';
				}
				switch(tr)
				{
					case '1':
									printf("%d",atoi(yytext));
									printf("Sin= >%d",SIN(atoi(yytext)));
									break;
					case '2':
									printf("Cos= >%d",COS(atoi(yytext)));
									break;
					case '3':
									printf("tan = >%d",TAN(atoi(yytext)));
									break;
					case '4':
									printf("cot= >%d",COT(atoi(yytext)));
									break;
					case '5':
									printf("sec= >%d",SEC(atoi(yytext)));
									break;
					case '6':
									printf("cosec= >%d",COSEC(atoi(yytext)));
									break;
					default:	
								printf("Invalid Operator!!");
								break;
				}	
			}*/
	      }
{operator} {
			operate=(char)yytext[0];
		}
{trigo} {
			trig_flag=1;
		}
{newline} {
			if(f1==1&&f2==1)
			switch(operate)
			{
				case '+':
						printf("Result : %d",op1+op2);
						break;
				case '-':
						printf("Result : %d",op1-op2);
						break;
				case '/':
						printf("Result : %d",op1/op2);
						break;
				case '*':
						printf("Result : %d",op1*op2);
						break;
				default:
						printf("Invalid Operator!!");
						break;
			}
			exit(0);
		}
%%

int main()
{
	yylex();
	return 0;
}
/*
OUTPUT:
akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/Calculator-LEX$ lex calculator.l 
akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/Calculator-LEX$ gcc lex.yy.c -ll 
akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/Calculator-LEX$ ./a.out
2+3
Result : 5
akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/Calculator-LEX$ ./a.out
4-2
Result : 2
akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/Calculator-LEX$ ./a.out
8/2
Result : 4
*/
