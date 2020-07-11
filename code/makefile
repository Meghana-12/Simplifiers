
make: 
	@echo "Hey!! Check this out: " 
	@echo "ENTER make start to Start the process" 
	@echo "ENTER make i to open the readme file"
	@echo "ENTER make clear to clear" 
	@echo "You can always come back here by entering make" 
startprocess: 
	@bison -d parser.y
	@lex code.l
	@gcc -o ex lex.yy.c parser.tab.c -IfI
	@./ex
	@ echo "if no err, ENTER make viewpage"
viewPage:
	@cd .. && cd app/ && npm start
	@echo "now you can view your page at http://localhost:3000/"
clear: 
	@rm -rf parser.tab.h parser.tab.c lex.yy.c ex
	@echo "cleared files in code directory"
	@cd ..  && rm -f app/src/index.js && cd .. & cd .. & echo "we are in simplifiers! Thankyou!"
	
