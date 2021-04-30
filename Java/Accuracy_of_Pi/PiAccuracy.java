/* EE 5453 - Engr. Programming II
 * 
 * by: Patrick Stockton
 * 
 * Problem 3: Accuracy of Pi
 * 
 * */

import java.util.*;
import java.text.*;
import java.math.*;

class PiAccuracy {
  DecimalFormat decimals = new DecimalFormat("#.###");
  public static final Scanner CONSOLE = new Scanner(System.in);
  
  public static void main(String[] args) {
    
    System.out.println("How many digits of accuracy of PI do you want? (Enter a value below 10!)");
    int acc = CONSOLE.nextInt();
    double pi = piCalc(acc);
    
  } // end of main

  // Function for calculating PI
    public static double piCalc (int accuracy) {
      double pi = 1.0;
      int temp = 1;
      int acc = accuracy;
      
      // Calculating the value of pi
      for (double i = 3.0; i < 1000000.0; i=i+2) {
        if (temp % 2 == 0) {
         pi = pi + (1.0/i);
        }
        else if (temp % 2 == 1) {
          pi = pi - (1.0/i);
        }
        temp = temp + 1;
      }
      
      pi = pi * 4;
      System.out.println(decimalPlaces(pi, accuracy));
    return pi;
  } // end of piCalc

    // Function for determining number of decimal places for PI
    public static String decimalPlaces(double pi, int accuracy) {
      System.out.println("Accuracy of " + accuracy + " of PI is: ");
      if (accuracy == 1) {
        return new DecimalFormat("#.#").format(pi);
      }
      else if (accuracy == 2) {
        return new DecimalFormat("#.##").format(pi);
      }
      else if (accuracy == 3) {
        return new DecimalFormat("#.###").format(pi);
      }
      else if (accuracy == 4) {
        return new DecimalFormat("#.####").format(pi);
      }
      else if (accuracy == 5) {
        return new DecimalFormat("#.#####").format(pi);
      }
      else if (accuracy == 6) {
        return new DecimalFormat("#.######").format(pi);
      }
      else if (accuracy == 7) {
        return new DecimalFormat("#.#######").format(pi);
      }
      else if (accuracy == 8) {
        return new DecimalFormat("#.########").format(pi);
      }
      else if (accuracy == 9) {
        return new DecimalFormat("#.#########").format(pi);
      }
      System.out.println("Maximum accuracy of pi is over 10, value returned: ");
        return String.valueOf(pi);
      
    } // end of decimalPlaces

} // end of PiAccuracy