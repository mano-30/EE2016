#include "LPC23xx.h"

int main()
{
  int x;  //Variable to store the input
  int highByte; //Store the first 4 bits of the input
  int lowByte; //Store the last 4 bits of the input
  FIO3DIR = 0xFFFFFFFF; //Set Output Pin
  FIO4DIR = 0x00000000; //Set Input Pin

  while(1)
  {
    FIO4PIN = FIO4PIN >> 8; //Get input
    x = FIO4PIN; //Store input
    highByte = x & 0xF0; //Get first 4 bits
    highByte = highByte >> 4; //Push bits to the right places
    lowByte = x & 0x0F; //Get last 4 bits
    FIO3PIN = highByte * lowByte; //Set the output of LED 
  }
	
  return 0;
} 
