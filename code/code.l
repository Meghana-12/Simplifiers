%{
#include<stdio.h>
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
[A-Z][a-zA-Z1-3]* {return (NAME);}
[a-z][A-Z]* {return (PROPNAME);}
"=" {return (EQ);}
\".*\" {return (PROPVAL);}
. {return (OTHER);}

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
