%{
#include<stdio.h>
#include<string.h>
#include "parser.tab.h"
void error();
FILE *yyin, *yyout;
%}

/* tagblock    \<[ \t\r\n\f]*[a-zA-Z]+[ \t\r\n\f]+([a-z][a-zA-Z]+[ \t\r\n\f]*=[ \t\r\n\f]*\".*\"[ \t\r\n\f]+)+\/[ \t\r\n\f]*\> */
/* tag \<[a-zA-Z]+ */
open \<[\t\r\n\f]*
compname (Heading|Para|Cards|Card)
propname (imgLink|title|content|titleSize|contentSize|titleColor|contentColor)
close \/\> 
container container 
spacing spacing=\{[1-9]\}
direction direction=(\"row\"|\"column\")
justify justify=(\"space\-evenly\"|\"space\-between\"|\"flex\-start\")
align alignItems=(\"center\"|\"flex\-start\") 
cgrid [\t\r\n\f]*\>
ctgrid \<\/Grid\>[\t\r\n\f]*
opgrid \<Grid[ \t\r\n\f]*

%%
{opgrid} {printf("%s\n", yytext);return GRID;}
{container} {printf("GRID\n");printf("%s\n", yytext);return (CONTAINER);}
{spacing} {printf("spacing\n\n");printf("%s\n", yytext);return SPACING;}
{direction} {printf("direction\n");printf("%s\n", yytext);return DIRECTION;}
{justify} {printf("justify\n");printf("%s\n", yytext);return JUSTIFY;}
{align} {printf("align\n");printf("%s\n", yytext);return ALIGN;}
{cgrid} {yylval.gclose = strdup(yytext);printf("%s\n", yytext);return CGRID;}
{ctgrid} {yylval.gclosetag = strdup(yytext);printf("%s\n", yytext);return CTGRID;}
{open} {printf("opentag\n");yylval.opentag = strdup(yytext); return (OPENTAG);}
{compname} {printf("compname\n");yylval.comp = strdup(yytext); return COMPNAME;}
{propname} {printf("propname\n");yylval.name = strdup(yytext); return (PROPNAME);}
"=" {return (EQ);}
\".*\" {yylval.value = strdup(yytext); return (PROPVAL);}
[ \t\r\n\f]* ;
{close} {printf("closingtag\n");yylval.closetag = strdup(yytext);return (CLOSINGTAG);}
. ;

%%

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