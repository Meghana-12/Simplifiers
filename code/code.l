%{
#include<stdio.h>
#include<string.h>
#include "y.tab.h"
void error();
FILE *yyin, *yyout;
%}

/* tagblock    \<[ \t\r\n\f]*[a-zA-Z]+[ \t\r\n\f]+([a-z][a-zA-Z]+[ \t\r\n\f]*=[ \t\r\n\f]*\".*\"[ \t\r\n\f]+)+\/[ \t\r\n\f]*\> */
/* tag \<[a-zA-Z]+ */
open \<
close \/\> 

%%

{open} {return (OPENTAG);}
{close} {return (CLOSINGTAG);}
"Heading" | "Para" | "Cards" {sscanf(yytext, "%s", yylval.val); return COMPNAME;}
"title" | "content" | "titleSize" | "contentSize" | "titleColor" | "contentColor" {sscanf(yytext, "%s", yylval.val); return (PROPNAME);}
"=" {return (EQ);}
\".*\" {sscanf(yytext, "%s", yylval.val); return (PROPVAL);}
. {error(); return (OTHER);}

%%

void error() {
    printf("Error");
}

// int main (int argc, char *argv[]) {
//     yyin = fopen("input.txt", "r");
//     yyout = fopen("output", "w");
//     yylex();
//     fclose(yyin);
// }
