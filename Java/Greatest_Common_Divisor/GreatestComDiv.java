/* EE 5453 - Engr. Programming II
 * 
 * by: Patrick Stockton
 * 
 * Problem 2: Find Greatest Common Divisor between two numbers
 * 
 * */

import java.util.*;

class GreatestComDiv {
  
  public static final Scanner CONSOLE = new Scanner(System.in);
  
  public static void main(String[] args) {
    int buffer = 0;
    
    System.out.println("This program finds the Greatest Common Divisor (GCD) between two integer numbers.");
    System.out.println("Please enter the first integer number of your choosing: ");
    int a = CONSOLE.nextInt( ); // prompt first user input
    
    System.out.println("Please enter the second integer number of your choosing: ");
    int b = CONSOLE.nextInt( ); // prompt second user input
    System.out.println("You've entered " + a + " and " + b);
    
    // Calculate GCD
    while (a != 0) {
     buffer = a; // Temporarily store the first value
     a = b % a; // Store remainder in first value variable
     b = buffer; 
    }
    
    System.out.println(b);
  } // end of main
  
} // end of GreatestComDiv