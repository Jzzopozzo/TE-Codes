/*
TITLE: Assignment to find a specific pattern in given input file and replace it with another word.
*/
%{
	#include<stdio.h>
	#include<string.h>
	FILE *fp1,*fp2;
	char old_word[20],new_word[20];
%}

space " "|"\t"
line "\n"
word [a-zA-Z]+

%%
{space} { fprintf(fp2,yytext);}
{line} {fprintf(fp2,yytext);}
{word} {

		if(strcmp(old_word,yytext)==0)
		{
			fprintf(fp2,new_word);
			printf("Word Replaced");
		}
		else
			fprintf(fp2,yytext);

}
. {fprintf(fp2,yytext);}
%%
int main(int argc,char *argv[])
{
	strcpy(old_word,argv[1]);
	strcpy(new_word,argv[2]);
	fp1=fopen("input.txt","r");
	fp2=fopen("input.txt","rw+");
	yyin=fp1;
	yylex();
	fclose(fp1);
	fclose(fp2);
	return 0;
}

/*
OUTPUT:

akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A2$ lex replace.l 
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A2$ gcc lex.yy.c -ll
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn2/Practice Assignments/A2$ ./a.out IT Computer
Word Replaced

*/
