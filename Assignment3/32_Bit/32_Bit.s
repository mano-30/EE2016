	TTL HalfCode Assembly
	AREA Program,CODE,READONLY
	ENTRY
	
Main
	LDR R0,LIST 		;Storing Input in List
	ANDS R1,R0,#0x0F000000	;Extracting last four bits of 1st byte
	MOV R1,R1, LSR#24	;Moving it to the correct place in the register
	ADD R5,R5,R1		;Adding it to the Final Register
	ANDS R2,R0,#0x000F0000	;Extracting last four bits of 2nd byte
	MOV R2,R2, LSR #12	;Moving it to the correct place in the register
	ADD R5,R5,		;Adding it to the Final Register
	ANDS R3,R0,#0x00000F00	;Extracting last four bits of 3rd byte
	ADD R5,R5,R3		;Adding it to the Final Register
	ANDS R4,R0,#0x0000000F	;Extracting last four bits of 4th byte
	MOV R4,R4, LSL #12	;Moving it to the correct place in the register
	ADD R5,R5,R4		;Adding it to the Final Register
	STR R5,Result		;Store the Result
	SWI &11			;End Program
		
LIST				;Input
	DCB &1C
	DCB &2D
	DCB &32
	DCB &46
		
Result
	DCD &0
	END