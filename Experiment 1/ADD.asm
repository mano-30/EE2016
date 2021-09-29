;
; example1.asm
;
; Created: 25-08-2021 14:31:44
; Author : ManomukilT
;


    .CSEG ; defines memory space to hold program
	LDI ZL,LOW(NUM<<1);load address of first data byte
	LDI ZH,HIGH(NUM<<1)
	LDI XL,0x60;load SRAM address in X-register
	LDI XH,0x00
	LDI R16,00 ; clear R16,used to hold carry
	LPM R0,Z+
	LPM R1,Z ; Get second number into R1
	ADD R0,R1 ; Add R0 and R1,result in R0,carry flag affected
	BRCC abc; jump if no carry,
	LDI R16,0x01 ; else make carry 1
abc: ST X+,R0 ; store result in RAM
	ST X,R16 ; store carry in next location
	NOP ; End of program, No operation
NUM: .db 0xD3,0x5F; The two numbers added, result put in SRAM from 0x60