/*---------------------------------------------------*/
/*  Name: Patrick Stockton                           */
/*  Created: Fall 2012                               */
/* 													 */
/*  Sorts an array pairwise                          */
/*                                                   */
/*****************************************************/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
int main() {
    int data[10];                       /*Gives an array from 0-9*/
    int i, lower;                       /*i is used for picking points out of the data array*/
    
    printf(" \n Original Array \n");    /*The Input (original) array*/
    for (i=0; i<10; i++) {				/*Creates the random number generation from 0 --> 9*/
        data[i] = rand() % 10; 
	}
        
	for (i=0; i<10; i++) {                /*Prints the original array*/
        printf(" %d", data[i]);         /*To print horizontally, vertically you can add a line break \n*/
    }
        
    i=0;
    for (i=0; i<10; i=i+2) {              /*i=i+2 allows for the pairs to be used, if it was i++, it would just go sequentially*/
        if (data[i+1] < data[i]) {       /*If the second number is less than the one before...*/
           lower = data[i+1];
           data[i+1] = data[i];
           data[i] = lower;  
        }
        else                            /*If it is not...*/
        lower =0;
    }
         
    printf("\n\n After Pairwise Array\n"); /*For the requestion shift result*/
         
    for (i=0; i<10; i++) {
     printf(" %d",data[i]);                /*Prints the shifted array*/
    }
             
    printf("\n\n"); /*!!! Only used to seperate... "Press any key..." from the above line*/
        

	system("pause");
	return 0;
}


