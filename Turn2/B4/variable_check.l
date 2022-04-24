/*				

Write a program using YACC specifications to implement syntax analysis phase of compiler
to validate type and syntax of variable declaration in Java.
*/

%{     
	#include "y.tab.h"
        //extern int yyval; 
%}


%%
"int"|"String"|"char"|"boolean" {return (DATATYPE);}
"=" { return (EQUAL);}
";" { return (SEMIC);}
[a-zA-Z]+ {yylval=yytext[0];return (ID);}
[0-9]+ {yylval=atof(yytext);return (NUM);}
%%
 

