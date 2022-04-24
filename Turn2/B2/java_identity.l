/*
				ASSIGNMENT NO-B2
TEB-02
TITLE-Write a program using Lex specifications to implement lexical analysis phase of compiler to
generate tokens of subset of ‘Java’ program.
*/
%{
	#include<stdio.h>
	#include<string.h>
	
	FILE *fp1;
	const char keyword[64];
%}

Package "import".*
data_type "int"|"float"|"char"|"double".*
comment "//".*
multiline_comment_open "/*".*
multiline_comment_close "*/"
loop "for(".*|"while".*
return "return".*
open_paranthesis "{".*
close_paranthesis .*"}".*
Class "class".*
Access_specifier "public"|"private"|"protected".*
Input_Statement "Scanner"|"BufferedReader"|"DataInputStream".*
Main "Public static void main".*
Assignment [a-zA-Z]+"=".*
%%
{Package} {
		printf("Package Statement\t\t\t\t %s",yytext);
	      }
{data_type} {
		printf("Data Type\t\t\t\t %s",yytext);
	    }
{comment} {
		printf("Comment\t\t\t\t %s",yytext);
	    }
{multiline_comment_open} {
		printf("Multiline Comment Open\t\t\t\t %s",yytext);
	    } 
{multiline_comment_close} {
		printf("Multiline Comment Close\t\t\t\t %s",yytext);
	    } 
{loop} {
		printf("Looping Statement\t\t\t\t %s",yytext);
	    }
{return} {
		printf("Return Statement\t\t\t\t %s",yytext);
	    }
{open_paranthesis} {
		printf("Opening Paranthesis\t\t\t\t %s",yytext);
	    }	
{close_paranthesis} {
		printf("Closing Paranthesis\t\t\t\t %s",yytext);
	    }	 
{Class} {	
		printf("Class Statement\t\t\t\t %s",yytext);
	}     
{Access_specifier} {
		printf("Access Specifier\t\t\t\t %s",yytext);
}
{Input_Statement} {
		printf("Input Statement\t\t\t\t %s",yytext);
}
{Main} {
		printf("Main method\t\t\t\t %s",yytext);
}
{Assignment} {
		printf("\tAssignment Statement\t\t\t\t %s",yytext);
}
. { }
%%

int main()
{

	fp1=fopen("Javainput.java","r");
	yyin=fp1;
	yylex();
 	fclose(fp1);
	return 0;
}


/*
OUTPUT:

akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/B2$ lex java_identity.l
akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/B2$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Akshay_SPOS/Turn2/B2$ ./a.out
Package Statement				 import java.io.*;

Class Statement				 class Javainput
Opening Paranthesis				 {
Access Specifier				 public
Opening Paranthesis				 {

Input Statement				 DataInputStream d=new DataInputStream(System.in);
Data Type				 int
Data Type				 int
Data Type				 int
Data Type				 int
Data Type				 int	Assignment Statement		 sum=no1+no2;
Data Type				 int
Closing Paranthesis				 	}
Closing Paranthesis				 }


