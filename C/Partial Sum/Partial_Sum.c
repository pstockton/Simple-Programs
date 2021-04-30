/*---------------------------------------------------*/
/*  Name: Patrick Stockton                           */
/*  Created: Fall 2012                               */
/* 													 */
/*  Calculates partial sums                          */
/*                                                   */
/*****************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int partialsum(int data[], int start, int end) {         /*Function that adds the selected array values*/
    int i;
    int sum=0;
    
    for(i=start; i<=end; i++)                          /*The function starts at the first index, ends at the "ending" index*/
    sum = sum + data[i];
    
    return sum;                                        /*Returns the output to the main() body*/
}

void partialprint(int data[], int start, int end) {      /*Prints the start and end index with values*/
     int i;
     
     printf("\nPartial Array Output: \n");
     
     for (i=start; i<=end; i++)
     printf(" %d %d\n", i, data[i]);
}


int main() {
    int data[15], start, end, i;
    
    printf("Enter Starting Index:\n");    /*Input for the starting index*/
    scanf("%d", &start);
    printf("\nEnter Ending Index:\n");    /*Input for the ending index*/
    scanf("%d", &end);
    
    printf("\nOriginal Array\n");         /*Prints the original array*/
    for (i=0; i<15; i++) {                /*15 array slots, so i<15*/
        data[i] = (rand() % 10)+10;       /*Only prints values of 10>*/
    }    
    for (i=0; i<15; i++) {                /*Prints the original array values*/
        printf(" %d", data[i]);
    }
    printf("\n");                         /*Just a line break*/
    
    partialprint(data, start, end);       /*Prints the partialprint function, which is the user inputted values*/
    printf("\nSum from data[%d] to data[%d] is: %d\n\n", start, end, partialsum(data, start, end));      /*Prints the sum of the input array boundry values from the user*/
    
        

        
    system("pause");
    return 0;
}
