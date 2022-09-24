#include "LPC23xx.h"

void delay(void) //function to generate delay to rotate rotor
{ 
  int i,j;
  for(i=0; i<0xFF;i++)
  for(j=0; j<0XFF;j++);
}

int main(void)
{ 
  IODIR0 = 0XFFFFFFFF; //Initializing output pin
	
  while(1)
  { 
    IOPIN0=0X00000240; //Output to enable 1st 2 magnets
    delay(); // wait for rotor to rotate
    IOPIN0=0X00000140; //Output to stop one magnet and enable next magnet
    delay(); // wait for rotor to rotate
    IOPIN0=0X00000180; //Output to stop one magnet and enable next magnet
    delay(); // wait for rotor to rotate
    IOPIN0=0X00000280; //Output to stop one magnet and enable next magnet
    delay(); // wait for rotor to rotate
  }
 
  return 0;
}