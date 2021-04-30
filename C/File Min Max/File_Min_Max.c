/*---------------------------------------------------*/
/*  Name: Patrick Stockton                           */
/*  Created: Fall 2012                               */
/*													 */
/*  Reads from Data file; finds Min, Max, Average    */
/*                                                   */
/*****************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main() {
    FILE *assign4;
    /* Initialize Variables */
    int assign;
    int assignavg;
    int min;
    int max;
    int i;
    int avg;
    
    /* Open Source File */
    /* Find Max Value */
    assign4 = fopen("assign4.txt","r");
    if (assign4 == NULL)
       printf("Error opening file\n");
    else {
         max = 0;
         while (feof(assign4) <= 0) {
          fscanf(assign4,"%d",&assign);
          if (assign > max)
          max = assign;
          }
    }
    /* Print Max Value */
    /* Close File */      
    printf("Max = %d\n",max);
    fclose(assign4);
    
    /* Open Source File */
    /* Find Min Value */
    assign4 = fopen("assign4.txt","r");
    
    if (assign4 == NULL)
       printf("Error opening file\n");
    else {
         min = 100;
         while (feof(assign4) <= 0) {
          fscanf(assign4,"%d",&assign);   
          if (assign < min)
             min = assign;
        }
    }
    /* Print Min Value */       
    printf("Min = %d\n",min);
    fclose(assign4);

    /* Find Average Value */
    assign4 = fopen("assign4.txt","r");
    for (i=1;i<=avg;i++) {
        fscanf(assign4,"%d",&assignavg);
        avg = assignavg/10;
    }

    printf("average = %d\n",assignavg);
    printf("average 2 = %d\n",avg);
    fclose(assign4);
  system("pause");
  return 0;
}

