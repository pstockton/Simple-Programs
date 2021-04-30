/*---------------------------------------------------*/
/*  Name: Patrick Stockton                           */
/*  Created: Fall 2012                               */
/*  												 */
/*  This program computes the roots				     */
/*  of the quadratic equation.                       */
/*                                                   */
/*****************************************************/

#include <stdio.h>
#include <math.h>

int main() {
 	float a, b, c, x1, x2;
 	int x;
 	char root;
 	
 	/* Inputing a, b, c,*/
 	printf("Enter value a: \n");
 	scanf("%f", &a);
 	printf("Enter value b: \n");
 	scanf("%f", &b);
 	printf("Enter value c: \n");
 	scanf("%f", &c);
 	
 	/* Solving sqrt(b^2-4ac)*/
 	x=sqrt(pow(b,2)-4*a*c);
 	
 	/* Solving for +- */
 	x1=(-b+x)/(2*a);
 	x2=(-b-x)/(2*a);
 	
 	/* Print Result */
 	printf("X1 = %8.3f \n", x1);
 	printf("X2 = %8.3f \n", x2);
 	
 	/* Declare Statements */
 	if (x<0)
 	   root = 'No real roots';
    else if (x=0)
  	   root = 'Two equal roots';
    else if (x>0)
       root = 'Two distinct roots';
    
	/* Print Declared Statement */   
    printf("%c\n", root);
 	

  system("pause");
  return 0;
}

