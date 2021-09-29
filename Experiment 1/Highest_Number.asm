;
; HighestNum.asm
;
; Created: 01-09-2021 16:55:13
; Author : ManomukilT
;


; Replace with your application code

	LDI ZL, LOW(NUM<<1);
	LDI ZH, HIGH(NUM<<1);	

	;LDI XL,0x60;
	LDI R16,0x00;
	LDI R17,0x00;

	LPM R0,Z+; Stores the number of numbers present in the memory

	LPM R1,Z+; Loads 1st number in the sequence
	
	MOV R16,R1; Moving the value to a dummy variable
	
	dec R0; Keeping the number of numbers in par in remaining numbers in sequence to execute loop

LOOP: LPM R2,Z+; To get the second number input
	
	MOV R17,R2; Moving it to a dummy variable
	CP R16,R17; Compare first two numbers
	BRGE gre; Incase second number is greater it goes to next line else it jumps
	
	MOV R16,R17; Implies R18 is greater than R17

    gre:DEC R0; Decrement the sequence
		    
	BRNE LOOP; To continue the loop till all the numbers are covered

	STS 0X60,R16; Puts the value in SRAM

	NOP;	End of program

NUM: .db 0x02,0x01,0x02