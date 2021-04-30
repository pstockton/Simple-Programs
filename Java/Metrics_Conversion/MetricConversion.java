////////////////////////////////////////////
//
//   Project I - Metric Conversion
//
//   by: Patrick Stockton
//
//   This program creates a conversion table for
//   kilograms to pounds, and feet/inches to meters
////////////////////////////////////////////
import java.util.*;

public class MetricConversion {
    public static final Scanner CONSOLE = new Scanner(System.in);
    
  public static void main(String[] args) {
    
    System.out.println( );
    System.out.println("Project 1 written by Patrick Stockton");
    System.out.println( );
    
    makeWeightTable( ); // Call Kg to Lbs function
    System.out.println( );
    makeLengthTable( ); // Call Feet/Inches to Meters function
       
  }
  
  //////////// Kg to Pounds Conversion Function ////////////
  public static void makeWeightTable( ) {
    
    double kilogramsLower = 0, kilogramsUpper = 0;
    double pounds = 0;
    
    // Prompt user to input lower value to calculate
    System.out.println("Choose a value for the lower bound of Kilograms: ");
    kilogramsLower = CONSOLE.nextInt( );
    
    System.out.println( );
    
    // Prompt user to input highest value to calculate to
    System.out.println("Choose a value for upper bound of Kilograms");
    kilogramsUpper = CONSOLE.nextInt( );
    
    System.out.println("\t Kilogram to Pound Conversion Table");
    System.out.println("Kg\t" + "Pounds");
    
    // Begin table calculations and printing
    for (double i = kilogramsLower; i <= kilogramsUpper; i++) {
     pounds = i/(0.45359237);
     System.out.print(i);
     System.out.println("\t" + pounds); 
    }
  }
  
  
  //////////// Feet & Inches to Meters Conversion Function ////////////
  public static void makeLengthTable( ) {
    
  double meters;
  int feet_input = 0, inches_input = 0;
  
  // Prompt user to input value of feet to compute
  System.out.println("Input feet: ");
  feet_input = CONSOLE.nextInt();
  
  // Prompt user to input value of inches to compute
  System.out.println("Input inches: ");
  inches_input = CONSOLE.nextInt();
  
  // Print the table title
  System.out.println("\t Feet & Inches to Meters Conversion Table");
  
  // Print the headers;
  System.out.println("        Inches");
  System.out.print("Feet");
    
  // Print the total inches index
  for (int i = 0; i <= inches_input; i++) {
    System.out.print("       " + i);
  }
   
  System.out.println();
    
  // Calculating the feet rows
  for (int feet = 0; feet <= feet_input; feet++) { // feet (9) will be inputted through console in the future (change)
    System.out.print(" " + feet + "    ");
     
    // Calculating the inches columns
    for (int inches = 0; inches <= inches_input; inches++) {
        
      meters = (0.024 * inches) + (feet * 12 * 0.024);
      System.out.printf(" %1$.4f ", meters);
                
    }
      
    System.out.println( );
   }
  }
    
}