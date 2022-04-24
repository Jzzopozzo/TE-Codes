%{
	#include<stdio.h>
	#include<string.h>
	
	FILE *fp1,*fp2;
	const char old_string[20],new_string[20];
%}

original_word [a-zA-Z]+
space \t
line "\n"
%%
{original_word} {
		if(strcmp(old_string,yytext)==0)	//if word found in file
			fprintf(fp2,new_string);
		else
			fprintf(fp2,yytext);		//if not keep it as it is
		}
{space} {fprintf(fp2,yytext);}
{line} {fprintf(fp2,yytext);}
. {fprintf(fp2,yytext);}
%%

int main(int argc,char *argv[])
{

	strcpy(old_string,argv[1]);
	strcpy(new_string,argv[2]);
	fp1=fopen("input.txt","r");
	fp2=fopen("new.txt","rw+");
	yyin=fp1;
	yylex();
	fclose(fp1);
	fclose(fp2);
	printf("Word Replaced");
	return 0;
}

/*
input.txt contents-
Akshay Chavan
K. K. Wagh
Computer Engineering

ABC

XYZ

IT


akshay@akshay-1011PX:~/Desktop/SPOS/Turn2/FileCopy$ lex replace.l 
akshay@akshay-1011PX:~/Desktop/SPOS/Turn2/FileCopy$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Desktop/SPOS/Turn2/FileCopy$ ./a.out IT COMPUTER
Word Replaced
*/
