%{
	#include<stdio.h>
	FILE * fp;
%}

Header "#include".*
MainFun .*"main()"
DataType "int" | "float" | "bool" | "char"
For "for(".*")"
Do "do ".*"while(".*");"
If "if(".*")"
While "while(".*")"

%%
{Header} {printf("Header file is %s", yytext);}
{MainFun} {printf("Main Function is %s", yytext);}
{DataType} {printf("Data type is %s", yytext);}
{For} {printf("For loop: %s", yytext);}
{Do} {printf("Do- while: %s", yytext);}
{If} {printf("Condition is %s", yytext);}
{While} {printf("Whlie loop: %s", yytext);}
%%

int main(int argc, char *argv[])
{
	fp= fopen(argv[1], "r");
	yyin= fp;
	yylex();
}
