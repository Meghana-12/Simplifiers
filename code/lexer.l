%{
#include<stdio.h>
#include<string.h>
#include "parser.tab.h"
void error();
char t[30];
FILE *yyin, *yyout;
%}

%option yylineno

/* propErr (sizeT.*[ \t\r\n\f]+|sizeC.*[ \t\r\n\f]+|colorT.*([ \t\r\n\f]+)|colorC.*([ \t\r\n\f]+)|imgLink.*([ \t\r\n\f]+)|title.*([ \t\r\n\f]+)|content.*([ \t\r\n\f]+)|^sizeT[ \t\r\n\f]+|^sizeC[ \t\r\n\f]+|^colorT([ \t\r\n\f]+)|^colorC([ \t\r\n\f]+)|^imgLink([ \t\r\n\f]+)|^title([ \t\r\n\f]+)|^content([ \t\r\n\f]+)) */
/* {propErr} {printf("err:  %s", yytext);} */
/* tagblock    \<[ \t\r\n\f]*[a-zA-Z]+[ \t\r\n\f]+([a-z][a-zA-Z]+[ \t\r\n\f]*=[ \t\r\n\f]*\".*\"[ \t\r\n\f]+)+\/[ \t\r\n\f]*\> */
/* tag \<[a-zA-Z]+ */
open \<[ \t\r\n\f]*
compname (Heading[ \t\r\n\f]+|Para[ \t\r\n\f]+|Card[ \t\r\n\f]+|Nav[ \t\r\n\f]+)
propname (sizeT|sizeC|colorT|colorC|imgLink|title|content)
close \/\>[ \t\r\n\f]+
container container[ \t\r\n\f]+
spacing spacing[ \t\r\n\f]+=\{[1-9]\}[ \t\r\n\f]+
direction direction[ \t\r\n\f]+=(\"row\"|\"column\"|\"row\-reverse\"|\"column\-reverse\")[ \t\r\n\f]+
justify justify[ \t\r\n\f]+=(\"space\-evenly\"|\"space\-between\"|\"flex\-start\"|\"flex\-end\"|\"space\-around\"|\"center\")
align alignItems[ \t\r\n\f]+=(\"space\-evenly\"|\"space\-between\"|\"flex\-start\"|\"flex\-end\"|\"space\-around\"|\"center\")
cgrid [ \t\r\n\f]*\>
ctgrid \<\/Grid\>[ \t\r\n\f]*
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
