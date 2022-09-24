		TTL OddEven
		AREA Program, CODE, READONLY;
		ENTRY
	
Main

		LDR R0,NUM1	;Store Result
		AND R1,R0,#1	;Odd if R1 = 1; Even if R1 = 0
		STR R1,Result	;Store Result
		SWI &11		;End Program
		
NUM1 		DCD &65534	;Input
		ALIGN
Result	
		DCD 0
		END 
	
		