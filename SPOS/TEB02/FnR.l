%{
	#include<stdio.h>
	#include<string.h>
	FILE *fr, *ff;
	char find[20], replace[20], file[30];
%}


Word [a-zA-Z]+
Number [0-9]
EOL \n

%%
{Word} {
	if(strcmp(find, yytext)== 0)
		fprintf(fr, replace);
	else
		fprintf(fr, yytext);
}

{Number} {
	if(strcmp(find, yytext)== 0)
		fprintf(fr, replace);
	else
		fprintf(fr, yytext);
}

{EOL} {
	fprintf(fr, yytext);
	fprintf(fr, yytext);
}
%%

int main(int argc, char *argv[])
{
	strcpy(find, argv[2]);
	strcpy(replace, argv[3]);
	ff= fopen(argv[1], "r");
	fr= fopen("rep.txt", "w");
	yyin= ff;
	yylex();
	return 0;
}
