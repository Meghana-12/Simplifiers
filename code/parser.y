%{
#include<stdio.h>
int yylex();
int yyerror(char *s);
%}



%token OPENTAG CLOSINGTAG EQ PROPVAL PTITLE PTITLE1 PTITLE2 PTITLE3 PCONTENT PCONTENT1 PCONTENT2 PCONTENT3 PIMG1 PIMG2 PIMG3 PTITLESIZE PTITLESIZE1 PTITLESIZE2 PTITLESIZE3 PCONTENTSIZE PCONTENTSIZE1 PCONTENTSIZE2 PCONTENTSIZE3

%type <value> PROPVAL 

%union {
    char *val;
}

%%
prog:
    s
; 
s:
    | stmt s 
;
stmt:
    OPENTAG name props CLOSETAG
;
name:
    HEADING | CARDS | PARA 
;

props:
    | prop props 
;

prop: 
    propname EQ PROPVAL {printf("Prop value: %s", $3);}
;
propname:
    PTITLE | PTITLE1 | PTITLE2 | PTITLE3
    |PCONTENT | PCONTENT1 | PCONTENT2 | PCONTENT3 
    | PIMG1 | PIMG2 | PIMG3 
    | PTITLESIZE | PTITLESIZE1 | PTITLESIZE2 | PTITLESIZE3
    | PCONTENTSIZE | PCONTENTSIZE1 | PCONTENTSIZE2 | PCONTENTSIZE3
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