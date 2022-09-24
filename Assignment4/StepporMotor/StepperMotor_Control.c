#include "LPC23xx.h"

void delay(void) //Generate delay to rotate motor
{ 
  int i,j;
  for(i=0; i<0xff;i++)
  for(j=0; j<0XFF;j++);
}	 

int main(void)
{ 
  IODIR0 = 0XFFFFFFFF; //Set output pin
  //All motor magnet configurations
  unsigned int output[] = {0X00000280,0X00000180,0X00000140,0X00000240}; 
  int angle = 80; //Set angle here(hardcoded)
	 
  for(int i = 0;i<angle;i+=2) // To denote magnet configuration to rotate 
  { 
			
    IOPIN0 = output[(i%8)/2]; //Choosing the magnet configuration
    delay(); // To let rotor rotate
	
  }
	
  return 0;
}