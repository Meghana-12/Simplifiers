%{
#include<stdio.h>
int yylex();
int yyerror(char *s);
int yyparse();
int errcount=0;
char *t;
char *k;
char *temp;
char *propname;
char *res;
extern FILE *yyin, *yyout;
%}



%token OPENTAG CLOSINGTAG EQ PROPVAL PROPNAME COMPNAME OTHER

%type <value> PROPVAL 
%type <name> PROPNAME
%type <comp> COMPNAME
%type <opentag> OPENTAG
%type <closetag> CLOSINGTAG
%union {
	char *value;
	char *name;
	char *comp;
    char *opentag;
    char *closetag;
}

%%
prog:
    s
; 
s:
    | stmt s 
;

props:
    | prop props 
;

prop: 
    PROPNAME EQ PROPVAL { printf( " %s = %s\n", $1, $3);}
;
stmt:
    OPENTAG COMPNAME props CLOSINGTAG 
;


%%

int yyerror(char * s){
    printf("error on line %s\n", s);
    errcount+=1;
    return 0;
}


// int main() {
//     yyparse();
//     return 0;
// }
int main() {
	// open a file handle to a particular file:
	FILE *myfile = fopen("input", "r");
    FILE *yyout = fopen("../app/src/index.js", "w");
    // FILE *yfile = fopen("output", "r+");
    // yyout = fopen("output", "w");
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
    if(errcount==0){
        rewind(myfile);
        printf("no err!!\n");
        FILE* start = fopen("start", "r");
        char ch;
        while((ch =fgetc(start))!=EOF) 
            fputc(ch,yyout);
        fclose(start);
        while( ( ch = fgetc(myfile) ) != EOF ){  
            fputc(ch, yyout);
        }
        FILE* end = fopen("end", "r");
        while((ch =fgetc(end))!=EOF) 
            fputc(ch,yyout);
        fclose(end);
        // while (fgets(ch,12,))
        printf("File copied successfully.\n Now go into the directory app and the run npm start, you'll be able to view the page.");
        fclose(yyout);
    }
    fclose(myfile);
}
