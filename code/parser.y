%{
#include<stdio.h>
int yyerror(char *s);
%}



%token OPENTAG CLOSINGTAG EQ PROPVAL PROPNAME COMPNAME OTHER

%type <value> PROPVAL 
%type <name> PROPNAME
%type <comp> COMPNAME
%union {
	char *value;
	char *name;
	char *comp;
}

%%
prog:
    s
; 
s:
    | stmt s 
;
stmt:
    OPENTAG COMPNAME props CLOSINGTAG 
;

props:
    | prop props 
;

prop: 
    PROPNAME EQ PROPVAL {printf("Prop Name: %s Prop value: %s\n", $1, $3);}
;


%%

int yyerror(char * s){
    printf("error on line %s\n", s);
    return 0;
}
extern int yylex();
extern int yyparse();
extern FILE *yyin;
// int main() {
//     yyparse();
//     return 0;
// }
int main() {
	// open a file handle to a particular file:
	FILE *myfile = fopen("input", "r");
	// make sure it is valid:
	if (!myfile) {
		printf("File not found\n");
		return -1;
	}
	// set lex to read from it instead of defaulting to STDIN:
	yyin = myfile;
	
	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));
	
}
