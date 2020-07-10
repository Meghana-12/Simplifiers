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

{open} {return (OPENTAG);}
{close} {return (CLOSINGTAG);}
{compname} {sscanf(yytext, "%s", yylval.comp); return COMPNAME;}
{propname} {sscanf(yytext, "%s", yylval.name); return (PROPNAME);}
"=" {return (EQ);}
\".*\" {sscanf(yytext, "%s", yylval.value); return (PROPVAL);}
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
