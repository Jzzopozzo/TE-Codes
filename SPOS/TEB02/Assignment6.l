%{
	#include<stdio.h>
	FILE *fp;
%}

Package "import".*
ClassDef "class ".*|Scanner
InBuiltFun "System.out.println(".*");"
MainFunction "public static void main".*
Assignment [a-zA-Z]+"= ".*
Compare [a-zA-Z0-9]+"== ".*
if "if".*
DataType "int"|"double"|"float"|"boolean"
Object .*"=new".*

%%
{Package} {printf("Package is %s", yytext);}
{ClassDef} {printf("Class is %s", yytext);}
{InBuiltFun} {printf("In- built function is %s", yytext);}
{MainFunction} {printf("Main function is %s", yytext);}
{Assignment} {printf("Assignment is %s", yytext);}
{Compare} {printf("Compare %s", yytext);}
{if} {printf("Condition to be checked is %s", yytext);}
{DataType} {printf("Datatype is %s", yytext);}
{Object} {printf("%s is object", yytext);}
%%

int main(int argc, char *argv[])
{
	fp= fopen(argv[1], "r");
	yyin= fp;
	yylex();
	return 0;
}


/*
PROBLEM STATEMENT:
		Write a program using lex specifications to implement lexical analysis phase of complier to generate tokens of subset of java programs.
unix@unix-HP-280-G1-MT:~/Documents/TEB03$ lex Assignment6.l
unix@unix-HP-280-G1-MT:~/Documents/TEB03$ gcc lex.yy.c -ll
unix@unix-HP-280-G1-MT:~/Documents/TEB03$ ./a.out Prime.java

Package is import java.util.*

public Class is class Prime {

    Main function is public static void main(String[] args) {

        Datatype is int Assignment is num= 29;
        Datatype is boolean Assignment is flag= false;
        for(Datatype is int Assignment is i= 2; i<= num/2; ++i)
        {
            // condition for nonprime number
            if(num% Compare i== 0)
            {
                Assignment is flag= true;
                break;
            }
        }

        if (!flag)
            In- built function is System.out.println(num + " is a prime number.");
        else
            In- built function is System.out.println(num + " is not a prime number.");
    }
}

Package is import java.util.*

public Class is class Prime {

    Main function is public static void main(String[] args) {

        Datatype is int Assignment is num= 29;
        Datatype is boolean Assignment is flag= false;
        for(Datatype is int Assignment is i= 2; i<= num/2; ++i)
        {
            // condition for nonprime number
            Condition to be checked is if(num% i== 0)
            {
                Assignment is flag= true;
                break;
            }
        }

        Condition to be checked is if (!flag)
            In- built function is System.out.println(num + " is a prime number.");
        else
            In- built function is System.out.println(num + " is not a prime number.");
    }
}




*/
