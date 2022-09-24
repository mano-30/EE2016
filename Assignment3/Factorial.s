		TTL Factorial.s
		AREA Program, CODE, READONLY;
		ENTRY
	
Main

		LDR R0,NUM1	;Load Input 
		SUB R1,R0,#1	;Subtract by one to have the required count 

Loop				;Start Loop
	
		MULS R0,R1,R0	;Multiply the old number with the new number
		SUBS R1,R1,#1	;Subtract one to get the next number
		BNE Loop	;Keep looping till we get 0 in R1
	
		SWI &11		;End Program
		
NUM1 		DCW &5 		;Input
		ALIGN 
		END 
	
		