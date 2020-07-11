
make: 
	@echo "Hey!! Check this out: " 
	@echo "ENTER make startProcess input_file=/*PATH/TO/CODE/FILE*/ to Start the process" 
	@echo "ENTER make i to open the readme file"
	@echo "ENTER make clear to clear" 
	@echo "You can always come back here by entering make" 
startProcess: 
	@bison -d parser.y
	@lex code.l
	@gcc -o ex lex.yy.c parser.tab.c -IfI
	@./ex $(input_file)
viewPage:
	@cd .. && cd app/ && npm i && npm start
	@echo "now you can view your page at http://localhost:3000/"
clear: 
	@rm -f parser.tab.h && rm -f parser.tab.c && rm -f lex.yy.c && rm -f ex
	@echo "cleared files in code directory"
	@cd ..  && rm -f app/src/index.tsx && cd .. & cd .. & echo "we are in simplifiers! Thankyou!"
	
