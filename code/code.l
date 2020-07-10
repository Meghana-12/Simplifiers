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

%%

{open} {yylval.opentag = strdup(yytext); return (OPENTAG);}
{close} {yylval.closetag = strdup(yytext);return (CLOSINGTAG);}
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