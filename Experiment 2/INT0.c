/*
 * INT0_C.c
 *
 * Created: 27-09-2021 08:36:50
 * Author : ManomukilT
 */

 #define F_CPU 1000000  // clock frequency

 #include <avr/io.h>
 #include <util/delay.h>
 #include <avr/interrupt.h>

 ISR (INT0_vect)
 {
 int i;
 for (i=1;i<=10;i++) // for 10 times LED blink

 {
 PORTB=0x01;
 _delay_ms(1000);   // delay of 1 sec
 PORTB=0x00;
 _delay_ms(1000);
 
 }
 
 
 }
 int main(void)
 {
 //Set the input/output pins appropriately
 //To enable interrupt and port interfacing
 //For LED to blink
 DDRD=0x00;   //Set appropriate data direction for D
 DDRB=0x00;   //Make PB0 as output
 MCUCR=0x00;  //Set MCUCR to level triggered
 GICR=0x40;   //Enable interrupt 0
 PORTB=0x00;
 sei();       // global interrupt flag

 while (1) //wait
 {

 }
 }
