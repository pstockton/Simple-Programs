/*---------------------------------------------------*/
/*  Name: Patrick Stockton                           */
/*  Created: Fall 2012                               */
/* 													 */
/*  Factorial and Exponential Functions              */
/*                                                   */
/*****************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* We can use a single variable factorial function to find i! */
long factorial(int n) {
     long factfunc = 1;
     while(n>1) {
     factfunc = factfunc*n;
     n--;
     }
     return factfunc;
    
}
/* Now that we have the denominator taken care of, we can now
find the numerator (x^i), which is basically increasing the 
power of x to each of the loop values of i */
double exponent(double x, int n) {
       /* Declaring the values for the double function */
       double x1;
       int x2;
       double sum=0,ratio;
       
       int i;
       for (i= 0; i<=n; i++) {
           x2 = factorial(i);      /*Takes the loop (sum) of the denominator*/
           x1 = pow(x,i);          /*Takes the loop (sum) of the numerator*/
           ratio = x1/x2;          /*Performs the requested function of (x^i)/i!*/
           sum = sum + ratio;      /*Continues the function until the limit is reached*/
           
        }
           return sum;
           
}
int main() {
    int n, i;     /*Interger Values*/
    float x;      
    double exact, sum;       /*Values for the exact and approximate sums*/
    
    printf("Enter n and x\n");        /*Asks user for n and x values*/
    scanf("%d %f",&n, &x);            /*Reads the user inputs*/
    
	exact = exp(x);       /*Calculates the exact answer*/
	printf("Exact = %8.6lf\n", exact);    /*Prints the exact answer*/

	sum = exponent(x, n);              /*Calculates the approximate answer*/
	printf("Approximation = %8.6lf\n", sum);           /*Prints the approximate answer*/

	system("pause");
	return (0);   
}
