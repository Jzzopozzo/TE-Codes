/*
TEB-02
TITLE: Write a program using Lex specifications to implement lexical analysis phase of compiler to
generate tokens of subset of C program.
*/
%{
	#include<stdio.h>
	#include<string.h>
	
	FILE *fp1;
	const char keyword[64];
%}

header_file "#include".*
data_type "int"|"float"|"char"|"double"
comment "//".*
multiline_comment_open "/*".*
multiline_comment_close "*/"
loop "for(".*|"while".*
return "return".*
open_paranthesis "{".*
close_paranthesis .*"}".*
open_bracket "(".*
close_bracket .*")".*

%%
{header_file} {
		printf("%s \t\t\t Header File",yytext);
	      }
{data_type} {
		printf("%s \t\t\t Data Type",yytext);
	    }
{comment} {
		printf("%s \t\t\t Comment",yytext);
	    }
{multiline_comment_open} {
		printf("%s \t\t\t Mulitline Comment Open",yytext);
	    } 
{multiline_comment_close} {
		printf("%s \t\t\t Mulitline Comment Close",yytext);
	    } 
{loop} {
		printf("%s \t\t\t Looping Statement",yytext);
	    }
{return} {
		printf("%s \t\t\t Return Statement",yytext);
	    }
{open_paranthesis} {
		printf("%s \t\t\t Opening Paranthesis",yytext);
	    }	
{close_paranthesis} {
		printf("%s \t\t\t Closing Paranthesis",yytext);
	    }	
{open_bracket} {
		printf("%s \t\t\t Opening Bracket",yytext);
	    }	
{close_bracket} {
		printf("%s \t\t\t Closing Bracket",yytext);
	    }	    	        
. { }
%%

int main()
{

	fp1=fopen("input.c","r");
	yyin=fp1;
	yylex();
	fclose(fp1);
	return 0;
}

/*

akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/C-Tokens-Identity$ lex c_identity.l 
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/C-Tokens-Identity$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/C-Tokens-Identity$ ./a.out input.c

#include<stdio.h> 			 Header File
#include<string.h> 			 Header File

int 			 Data Type
char 			 Data Type
float 			 Data Type
	int main() 			 Closing Bracket
{ 			 Opening Paranthesis
		for(int i=0;i<10;i++)   	 			 Closing Bracket
//for loop 			 Comment
{ 			 Opening Paranthesis
		} 			 Closing Paranthesis
return 0; 			 Return Statement
	} 			 Closing Paranthesis
/ * 			 Mulitline Comment Open

* / 			 Mulitline Comment Close*/
