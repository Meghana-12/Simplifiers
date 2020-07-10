%{
#include<stdio.h>
int yylex();
int yyerror(char *s);
%}



%token OPENTAG CLOSINGTAG EQ PROPVAL PROPNAME COMPNAME

%type <value> PROPVAL 
%type <name> PROPNAME
%union {
    char *val;
    char *name;
}

%%
prog:
    s
; 
s:
    | stmt s 
;
stmt:
    OPENTAG COMPNAME props CLOSETAG
;

props:
    | prop props 
;

prop: 
    PROPNAME EQ PROPVAL {printf("Prop Name: %s Prop value: %s", $1, $3);}
;


%%

int yyerror(char * s){
    printf("error on line %s\n", s);
    return 0;
}

int main() {
    yyparse();
    return 0;
}