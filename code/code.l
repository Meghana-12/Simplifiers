%{
#include<stdio.h>
void error();
FILE *yyin;
%}

tagblock	\<[a-zA-Z]+[\n\s]+([a-z][a-zA-Z]+(\s)*=(\s)*\".*\"[\n\s\t]+)+\/\>
tag	\<[a-zA-Z]+

%%

{tagblock}	{printf("%s\n", yytext);}

%%

void error() {
	printf("Error");
}

int main (int argc, char *argv[]) {
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
}
