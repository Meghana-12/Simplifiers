%{
#include<stdio.h>
#include<string.h>
#include "parser.tab.h"
void error();
FILE *yyin, *yyout;
%}

/* tagblock    \<[ \t\r\n\f]*[a-zA-Z]+[ \t\r\n\f]+([a-z][a-zA-Z]+[ \t\r\n\f]*=[ \t\r\n\f]*\".*\"[ \t\r\n\f]+)+\/[ \t\r\n\f]*\> */
/* tag \<[a-zA-Z]+ */
open \<
compname (Heading|Para|Cards)
propname (title|content|titleSize|contentSize|titleColor|contentColor)
close \/\> 
container container 
spacing spacing=\{[1-9]\}
direction direction=("row"|"column")
justify justify=("space-evenly"|"space-between"|"flex-start")
align alignItems=("center"|"flex-start") 
cgrid \>
ctgrid \<\/Grid\>
grid Grid
%%

{open} {yylval.opentag = strdup(yytext); return (OPENTAG);}
{close} {yylval.closetag = strdup(yytext);return (CLOSINGTAG);}
{grid} {return GRID;}
{container} {return (CONTAINER);}
{spacing} {return SPACING;}
{direction} {return DIRECTION;}
{justify} {return JUSTIFY;}
{align} {return ALIGN;}
{compname} {yylval.comp = strdup(yytext); return COMPNAME;}
{propname} {yylval.name = strdup(yytext); return (PROPNAME);}
"=" {return (EQ);}
\".*\" {yylval.value = strdup(yytext); return (PROPVAL);}
[ \t\r\n\f]* ;
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