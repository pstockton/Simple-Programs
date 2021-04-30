//////////////////////////////////////////
//
//  Lab IV - Star Wars Names Generator
// 
//  By: Patrick Stockton
//
//  Purpose: Designing a Star Wars name
//           Generator for given inputs
//
//////////////////////////////////////////
import java.util.*;

public class StarWarsName {
  public static final Scanner CONSOLE = new Scanner(System.in);
  
  public static void main(String[] args) {
    String lastname = "", planet = "", last = "", maiden = "", city = "", car = "", first = "";
    
    System.out.println("Lab 4 written by Patrick Stockton");
    
    System.out.println("Enter your first name: ");
    first = firstName(promptString(first)); // First Name Prompt
    
    System.out.println("Enter your last name: ");
    last = promptString(last); // Last Name Prompt
    lastname = lastName(last); 
    
    System.out.println("Enter your mother's maiden name: ");
    maiden = maidenName(promptString(maiden)); // Maiden Name Prompt
    
    System.out.println("Enter the city where you were born: ");
    city = cityName(promptString(city)); // City Name Prompt
    
    System.out.println("Enter the first car you drove: ");
    car = promptString(car); // Car Name Prompt
    
    planet = lastNameEnd(last) + car; // Determining the Planet Name
    
    // Display output
    System.out.print("You are " + toUpper(first) + toUpper(lastname) + " ");
    System.out.print(toUpper(maiden) + toUpper(city) + " of ");
    System.out.println(toUpper(planet));
    
    
  } // end of main
  
  
  // Function for Prompting the text String
  public static String promptString(String firstName) {
    String text = "";
    
    text = CONSOLE.nextLine( );
    text = text.trim( ); // function for trimming out extra spaces
    
    if (text.length( ) < 3) { // if inputted text is less than 3 characters long
    text = text + text; // function for doubling the text inputted by the user
    }
    
    return text;
  } // end of promptString
  
  
  // Determining the first three characters of the first name
  public static String firstName(String first) {
    String firstName = "";
    
    for (int i = 0; i < 3; i++) {
      char c = first.charAt(i);
      firstName = firstName + c;
    }
    
    return firstName;
  } // end of firstName
  
  
  // Determining the first two characters of the last name
  public static String lastName(String last) {
    String lastName = "";
    
    for (int i = 0; i < 2; i++) {
      char c = last.charAt(i);
      lastName = lastName + c;
    }
    
    return lastName;
  } // end of lastName
  
  
  // Determining the first two characters of the maiden name
  public static String maidenName(String maiden) {
    String maidenName = "";
    
    for (int i = 0; i < 2; i++) {
      char c = maiden.charAt(i);
      maidenName = maidenName + c;
    }
    
    return maidenName;
  } // end of maidenName
  
  
  // Determining the first three characters of the city name
  public static String cityName(String city) {
   String cityName = "";
   
   for (int i = 0; i < 3; i++) {
     char c = city.charAt(i);
     cityName = cityName + c;
   }
   
   return cityName; 
  } // end of cityName
  
  
  // Determining the last two characters of the last name
  public static String lastNameEnd(String last) {
    String lastName = "";
    int length = last.length( );
    
    for (int i = length - 2; i < length; i++) {
      char c = last.charAt(i);
      lastName = lastName + c;
    }

    return lastName;
  } // end of lastNameEnd
  
  
  // Converting the text to upper case
  public static String toUpper(String Upper){
    String upper = "";
    
    upper = Upper.toUpperCase();
    
    return upper;
  } // end of toUpper
  
  
} // end of StarWarsName class