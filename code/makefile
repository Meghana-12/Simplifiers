
REBUILDABLES = parser.tab.h parser.tab.c lex.yy.c ex

make: 
	@echo "Hey!!We are team Simplifiers!! Check this out: " 
	@echo "1.ENTER make startProcess input_file=/*PATH/TO/CODE/FILE*/ to Start the process (there is a example input file 'input' " 
	@echo "2.ENTER make clear to clear" 
	@echo "3.You can always come back here by entering make" 
startProcess: 
	@bison -d parser.y
	@lex code.l
	@gcc -o ex lex.yy.c parser.tab.c -IfI
	@./ex $(input_file)
viewPage:
	@cd .. && cd app/ && npm i && npm start
	@echo "Now you can view your page at http://localhost:3000/"
clear: 
	@rm -rf $(REBUILDABLES)
	@cd ..  && rm -f app/src/index.tsx && cd .. & cd .. & echo " Cleared all the rebuildables!!Thankyou!"
	
