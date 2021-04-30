/*---------------------------------------------------*/
/*	Name: Patrick Stockton                           */
/*  Created: Fall 2012								 */
/*         				                             */
/*  This program computes the area and volume of a   */
/*  circle given its radius                          */
/*****************************************************/

#include <stdio.h>
#include <math.h>

#define PI 3.141593

int main(void) {
    /* Declare Variables */
    float area, volume, radius;
    
    /* Get Radius from Keyboard */
    printf("Enter Radius: \n");
    scanf("%f",&radius);
    
    /*Compute Area */
    area = 4*pow(radius,2)*PI;
    
    /* Compute Volume */
    volume = 1.33333333*pow(radius,3)*PI;
    
    /* Print Area and Volume */
    printf("Area = %8.3f \n", area);
    printf("Volume = %8.3f \n",volume);
    
    /* Exit Program */
    
      system("pause");
  return 0;
}

