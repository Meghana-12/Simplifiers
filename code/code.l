%{
#include<stdio.h>
#include<string.h>
#include "parser.tab.h"
void error();
FILE *yyin, *yyout;
%}

%option yylineno

/* tagblock    \<[ \t\r\n\f]*[a-zA-Z]+[ \t\r\n\f]+([a-z][a-zA-Z]+[ \t\r\n\f]*=[ \t\r\n\f]*\".*\"[ \t\r\n\f]+)+\/[ \t\r\n\f]*\> */
/* tag \<[a-zA-Z]+ */
open \<[\t\r\n\f]*
compname (Heading|Para|Cards|Card)
propname (imgLink|title|content|titleSize|contentSize|titleColor|contentColor)
close \/\>[\t\r\n\f]*
container container 
spacing spacing=\{[1-9]\}
direction direction=(\"row\"|\"column\")
justify justify=(\"space\-evenly\"|\"space\-between\"|\"flex\-start\")
align alignItems=(\"center\"|\"flex\-start\") 
cgrid [\t\r\n\f]*\>
ctgrid \<\/Grid\>[\t\r\n\f]*
opgrid \<Grid[ \t\r\n\f]*

%%
{opgrid} {return GRID;}
{container} {return (CONTAINER);}
{spacing} {return SPACING;}
{direction} {return DIRECTION;}
{justify} {return JUSTIFY;}
{align} {return ALIGN;}
{cgrid} {yylval.gclose = strdup(yytext); return CGRID;}
{ctgrid} {yylval.gclosetag = strdup(yytext); return CTGRID;}
{open} {yylval.opentag = strdup(yytext); return (OPENTAG);}
{compname} {yylval.comp = strdup(yytext); return COMPNAME;}
{propname} {yylval.name = strdup(yytext); return (PROPNAME);}
"=" {return (EQ);}
\".*\" {yylval.value = strdup(yytext); return (PROPVAL);}
[ \t\r\n\f]* ;
{close} {yylval.closetag = strdup(yytext); return (CLOSINGTAG);}
. ;

%%
/*
void yyerror(const char *str)
{
	fprintf(stderr, "Error : %s at line number : %d\n", str, yylineno);
	errcount++;
}
*/
void error() {
    printf("Error\n");
}
int yywrap(void) {
    return 1;
}
// int main (int argc, char *argv[]) {
//     yyin = fopen("input.txt", "r");
//     yyout = fopen("output", "w");
//     yylex();
//     fclose(yyin);
// }
