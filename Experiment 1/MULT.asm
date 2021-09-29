;
; MULT.asm
;
; Created: 01-09-2021 14:47:27
; Author : ManomukilT
;


; Replace with your application code
/*
 *
 *		Multiplication of two given numbers
 *
 *		INPUT - From FLASH Memory
 *		OUTPUT - To SRAM locations 0x60 (productL), 0x61 (productH)
 *
 *
 */

	.CSEG;	Start Program

	LDI ZL, LOW(NUM<<1);
	LDI ZH, HIGH(NUM<<1);	

	LDI XL,0x60; Initialising X to point to SRAM for Storage
	LDI XH,0x00;

	LPM R3, Z+;	Getting Multiplicand
	LPM R4, Z;	Getting Multiplier

	LDI R16, 0x00;	
	LDI R17, 0x00;
	LDI R18, 0x00;Setting Carry register

	MUL R3,R4 ; Multiply the numbers
	
	MOV R16,R0;
	MOV R17,R1;
	
	BRCC abc; Check carry and update carry register if carry is 1
	LDI R18, 0x01; update when carry is 1

	

abc: ST X+,R16; Store LByte
	ST X+,R17; Store HByte
	ST X,R18; Store Carry
	NOP;	End of Program

NUM: .db 0xFF, 0xFF;
