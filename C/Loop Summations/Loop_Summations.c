/*---------------------------------------------------*/
/*  Name: Patrick Stockton                           */
/*  Created: Fall 2012                               */
/*													 */
/*  Calculation of Sums                              */
/*                                                   */
/*****************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {
    /*While Loop*/
    int n;
    int i;
    float totalfor=0,totalwhile=0,totaldowhile=0;
    
    /*User input of "n"*/
    printf("Enter n\n");
    scanf("%d",&n);
    
    /*For loop*/
    for(i=1; i<=n; i++)
    {
    totalfor = totalfor + 1/(pow(2,i));
    printf("Inside for total = %f\n",totalfor);
}
    /*While loop*/
    i=1;
    while (i<=n)
    {
    totalwhile = totalwhile + i*(i+1);
    printf("Inside while loop total = %f\n",totalwhile);
    i++;
    }
    
    /*Do While Loop, 1/(i*(i+1)) --> i was distributed for it to work*/
    i=1;
    do {
        totaldowhile = totaldowhile + 1/(pow(i,2) + i);
        printf("Inside Do While Loop Total = %f\n",totaldowhile);
        i++;
        } while (i<=n);
        
    
    printf("For Loop Total = %f\n",totalfor);
    printf("While Loop Total = %f\n",totalwhile);
    printf("Do While Loop Total = %f\n",totaldowhile);

  system("pause");
  return 0;
}

