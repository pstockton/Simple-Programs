//////////////////////////////////////////
//
//  Lab III - Future Values
// 
//  By: Patrick Stockton
//
//  Purpose: Calculating Compound Interest
//           and Annuity
//
//////////////////////////////////////////

import java.util.*;
import java.lang.Math;
import java.text.*;

public class FutureValues {
  
  public static final Scanner CONSOLE = new Scanner(System.in);
  
  // Start of main
  public static void main(String[] args) {
  
    double value = 0, interest = 0, years = 0, yearly = 0;
    
    System.out.println("Lab 3 written by Patrick Stockton\n");
    
    ////////// Test for Compound Interest //////////
    System.out.println("Input money value: ");
    value = CONSOLE.nextDouble( ); // Value input (CompoundInterest)
    
    System.out.println("Input interest rate: ");
    interest = CONSOLE.nextDouble( ); // Interest input (CompoundInterest)
    
    System.out.println("Input number of years: ");
    years = CONSOLE.nextDouble( ); // Number of years (CompoundInterest)
    
    
    // Calculating the present value over a inputted interest and years.
    //Compound_Interest(value, interest, years);
    System.out.print("The value(" + value + ") with an interest rate of (" + interest + ")");
    System.out.println(" over (" + years + ") years is = " + moneyString(Compound_Interest(value, interest, years)));
    
    
    ////////// Test for Annuity //////////
    System.out.println("\nBelow is the test for the Annuity \n");
    System.out.println("Input yearly payment value: ");
    yearly = CONSOLE.nextDouble( ); // Yearly Payment input (Annuity)
    
    System.out.println("Input interest rate: ");
    interest = CONSOLE.nextDouble( ); // Interest input (Annuity)
    
    System.out.println("Input number of years: ");
    years = CONSOLE.nextDouble( ); // Number of years (Annuity)
    System.out.print("The yearly payment of (" + yearly + ") with an interest rate of (" + interest + ")");
    System.out.println(" over (" + years + ") years is = " + moneyString(Annuity(yearly, interest, years)));
                           
  } // End of main
  
  
  // Function for calculating the future value from the given present value, interest, and years
  public static double Compound_Interest(double value, double interest, double years) {
    
    double future_value = 0;
    
    future_value = value*Math.pow((1 + interest/100), years);
    
    return future_value;
  } // End of Compound_Interest
  
  
  // Function for calculating the Annuity from the given yearly payment, interest, and years
  public static double Annuity(double yearly, double interest, double years) {
    
    double annuity = 0;
    
    annuity = yearly * ((Math.pow((1 + interest/100), years) - 1) / (interest/100));
    return annuity;
  }
  
  // Formatting the output value
  public static String moneyString(double amount) {
    DecimalFormat dollarsAndCents = new DecimalFormat("$#0.00");
    return dollarsAndCents.format(amount);
  }
  
  
  
  
  
   
} // End of class