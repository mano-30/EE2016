;
; INT1.asm
;
; Created: 26-09-2021 20:45:54
; Author : ManomukilT
;


; Replace with your application code
;Start
.org 0;
rjmp reset;

.org 0x0002;
rjmp int1_ISR;

.org 0x0100;

reset:
        LDI R16,0x70; Loading Stacker Point Address
        OUT SPL,R16;
        LDI R16,0x00;
        OUT SPH,R16;

        LDI R16,0x01; Interface PortB pin0 to be output
        OUT DDRB,R16; so to view LED Blinking

        LDI R16,0x00;
        OUT DDRD,R16;

        OUT MCUCR, R16;Set MCUCR register to enable low level interrupt
        
		LDI R16, 0x80;Set GICR Resgister to enable interrupt 1
        OUT GICR, R16;

        LDI R16, 0x00;
        OUT PORTB, R16;

        SEI;

ind_loop:
    RJMP ind_loop;

int1_ISR:
    IN R16, SREG;
    PUSH R16;

    LDI R16, 0x0A;
    MOV R0, R16;

    c1:	 LDI R16, 0x01;
    OUT PORTB, R16

    LDI R16, 0x05
    a1:	 LDI R17, 0xFF
    a2:  LDI R18,0xFF
	a3:	 DEC R18
	BRNE a3	 
	DEC R17
    BRNE a2
    DEC R16
    BRNE a1

    LDI R16, 0x00
    OUT PORTB, R16

    LDI R16, 0x05
    b1:	 LDI R17, 0xFF
    b2:	 LDI R18, 0xFF	 
	b3:  DEC R18
	BRNE b3
	DEC R17
    BRNE b2
    DEC R16
    BRNE b1

    DEC R0
    BRNE c1
    POP R16
    OUT SREG, R16

    RETI
