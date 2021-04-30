//////////////////////////////////////////
//
//  Lab II - Coins
// 
//  By: Patrick Stockton
//
//  Purpose: Counting coins and making change
//
//////////////////////////////////////////
import java.util.*;

public class Coins {
  public static final Scanner CONSOLE = new Scanner(System.in);
  
  // Main function
  public static void main(String[] args) {
    
    // Title
    System.out.println("Lab 2 written by Patrick Stockton");
    System.out.println( );
    
    // Function for the user to input amount of each coin, while determining the total $ amount inputted
    TotalValue( ); // TotalValue (inputted individual coin amounts)
    
    System.out.println("  \n");
    // Function for the user to input a total $ amount, and determine the amount of each coin needed
    TotalChange( ); // TotalChange (inputted total cents/money amount, calc coins)
    
    
  }
  
  // Function for finding the value of coins inputted as well as the number of coins chosen
  public static void TotalValue( ) {
    
    int Quarters, Dimes, Nickels, Pennies, Total_Coins; // Number of coins (real number)
    double Total = 0, Total_Quarters = 0, Total_Dimes = 0; // Total value of coins (could be fractional)
    double Total_Nickels = 0, Total_Pennies = 0;
    
    System.out.println("Preparing to calculate total change amount inputted... ");
    System.out.println( );
    System.out.println("Please input total amount of QUARTERS");
    Quarters = CONSOLE.nextInt( ); // User input for total quarters
    System.out.println("Please input total amount of DIMES");
    Dimes = CONSOLE.nextInt( ); // User input for total dimes
    System.out.println("Please input total amount of NICKELS");
    Nickels = CONSOLE.nextInt( ); // User input for total nickels
    System.out.println("Please input total amount of PENNIES");
    Pennies = CONSOLE.nextInt( ); // User input for total pennies
    
    // Calculate the total amount of coins
    Total_Coins = Quarters + Dimes + Nickels + Pennies;
    System.out.println("The total amount of coins inputted is " + Total_Coins);
    
    // Calculate the total value of coins inputted (for loops)
    // Calculating total value of Quarters
    for (int i = 1; i <= Quarters; i++) {
      Total_Quarters = Total_Quarters + 0.25;
    }
    
    // Calculating total value of Dimes
    for (int i = 1; i <= Dimes; i++) {
      Total_Dimes = Total_Dimes + 0.1;
    }
    
    // Calculating total value of Nickels
    for (int i = 1; i <= Nickels; i++) {
      Total_Nickels = Total_Nickels + 0.05;
    }
    
    // Calculating total value of Pennies
    for (int i = 1; i <= Pennies; i++) {
      Total_Pennies = Total_Pennies + 0.01;
    }
    
    // Calculating the total value of the coins and displaying
    Total = Total_Quarters + Total_Dimes + Total_Nickels + Total_Pennies;
    System.out.println("The total value of the coins is $" + Total);
  }
  
  
  
  
  
  
  // Function to calculate the amount of change needed for an inputted value
  public static void TotalChange( ) {
    
    // Variables to keep track of progress (amounts inputted/calculated)
    double inputTotal = 0, Remaining = 0; // Value inputted and remaining (after calculations)
    double Total_Quarters = 0, Total_Dimes = 0, Total_Nickels = 0, Total_Pennies = 0; // Keeping track of coin amount(s)
    double Total_Coins = 0;// Determining the total number of coins
    
    // Prompting the user to input total value to convert
    System.out.println("When you get a chance, please input the total value you wish to convert to change.");
    inputTotal = CONSOLE.nextDouble( );
    
    
    // Determine how many quarters that are (increment while subtracting from total)
    while (inputTotal >= 25) {
      //System.out.println("Q: " + Total_Quarters);
      Total_Quarters++;
      inputTotal = inputTotal - 25;
    }
    
    // Determine how many dimes that are (increment while subtracting from total)    
    while (inputTotal >= 10) {
      Total_Dimes++;
      inputTotal = inputTotal - 10;
    }
    
    // Determine how many nickels that are (increment while subtracting from total)
    while (inputTotal >= 5) {
      Total_Nickels++;
      inputTotal = inputTotal - 5;
    }
    
    // Determine how many pennies that are (increment while subtracting from total)
    while (inputTotal >= 1) {
      Total_Pennies++;
      inputTotal = inputTotal - 1;
    }
    
    
    // Display the number of coins
    System.out.println("Below is the total amount of each coin needed: ");
    System.out.println("Quarters: " +Total_Quarters);
    System.out.println("Dimes: " +Total_Dimes);
    System.out.println("Nickels: " +Total_Nickels);
    System.out.println("Pennies: " +Total_Pennies);
    
    
    // Calculate the total amount of coins produced  
    Total_Coins = Total_Quarters + Total_Dimes + Total_Nickels + Total_Pennies;
    System.out.println("The total amount of coins used are; " + Total_Coins);
      
    
    
    
    
  }
  
  
  
  
}