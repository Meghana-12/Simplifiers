%{
#include<stdio.h>
int yylex();
void yyerror(const char *str);
int yyparse();
int errcount=0;
extern int yylineno;
extern FILE *yyin, *yyout;
%}



%token OPENTAG CLOSINGTAG EQ PROPVAL PROPNAME COMPNAME CONTAINER SPACING DIRECTION JUSTIFY ALIGN CGRID CTGRID GRID

%type <value> PROPVAL 
%type <name> PROPNAME
%type <comp> COMPNAME
%type <opentag> OPENTAG
%type <closetag> CLOSINGTAG
%type <gclosetag> CTGRID
%type <gclose> CGRID
%type <gopentag> GRID
%union {
	char *value;
	char *name;
	char *comp;
    	char *opentag;
    	char *closetag;
    	char *gclosetag;
    	char *gclose;
    	char *gopentag;
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
    | GRID gprops CGRID s CTGRID 
;
props:
    | prop props 
;
gprops:
    |gprop gprops
;
gprop:
    CONTAINER | SPACING | DIRECTION | JUSTIFY | ALIGN 
;
prop: 
    PROPNAME EQ PROPVAL
;


%%

void yyerror(const char *str)
{
		// error
        fprintf(stderr, "Error : %s at line number : %d\n", str, yylineno);
		// errcount counts the number of errors
        errcount++;
}

int main(int argc, char *argv[]) {
	// open a file handle to a particular file:
	FILE *myfile = fopen(argv[1], "r");
    	FILE *yyout = fopen("../app/src/index.tsx", "w");
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
	// checks if there isn't an error 
    	if(errcount==0){
			// if theres no error then index.tsx file is created and necessary content is loaded
        	rewind(myfile);
        	//printf("no err!!\n");
        	FILE* start = fopen("start", "r");
        	char ch;
			// to write the start code from start to index.tsx 
        	while((ch =fgetc(start))!=EOF) 
            		fputc(ch,yyout);
        	fclose(start);
			// to write the input into index.js
        	while( ( ch = fgetc(myfile) ) != EOF ) {  
            		fputc(ch, yyout);
        	}
        	FILE* end = fopen("end", "r");
			// to write the end code from start to index.tsx 
        	while((ch =fgetc(end))!=EOF) 
            		fputc(ch,yyout);
        	fclose(end);
        	fclose(yyout);
		fprintf(stdout, "Great!! There's no error !! Now, enter make viewPage to view the page at http://localhost:3000/\n");
    	}
    	fclose(myfile);
}
