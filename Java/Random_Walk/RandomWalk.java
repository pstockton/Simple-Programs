//////////////////////////////////////////
//
//  Lab VII - Random Walks
// 
//  By: Patrick Stockton
//
//  Purpose: Simulate a random walk using a Graphics
//     object. Ask the user for information.
//
//////////////////////////////////////////
import java.awt.*;
import java.util.*;

// RandomWalk class for simulating the random walk scenario
public class RandomWalk {
  public static final Scanner CONSOLE = new Scanner(System.in);
  public static int PANEL_WIDTH = 300; // initial panel width
  public static int PANEL_HEIGHT = 200; // initial panel height
  public static int size = 0; // radius (size) of circle
  
  public static void main(String[] args) {
    System.out.println("\nLab 7 written by Patrick Stockton");
    circleSize( ); // Prompting the circle size
    DrawingPanel panel = new DrawingPanel(PANEL_WIDTH, PANEL_HEIGHT); // Size*3, Size*2
    Graphics g = panel.getGraphics( );

    Random rand = new Random( ); // new random variable

    int input = 0, x = PANEL_WIDTH / 3 + size / 2, y = PANEL_HEIGHT / 4 + size / 2; // converting the panel width and height
    int count = 0; // variable for counting the total number of steps
    
    circleColor(g); // Prompt the user for the circle color
    g.drawOval(PANEL_WIDTH/3, PANEL_HEIGHT/4, size, size); // Creating the circle
    walkColor(g); // Prompt the user for the walk color

    // Test for if the walk exits the circle
    while (x > PANEL_WIDTH / 3 && x < PANEL_WIDTH /3 + size && y > PANEL_HEIGHT / 4 && y < PANEL_HEIGHT / 4 + size) {
      input = rand.nextInt(4);
      if (input == 0)
        x++;
      else if (input == 1)
        x--;
      else if (input == 2)
        y++;
      else if (input == 3)
        y--;
      g.drawLine(x, y, x, y);
      count++; // Track the number of "steps"
      panel.sleep(1); // Delay (to watch animation)
    }
    g.drawString("Total steps taken: " + count, 5, 10);
    System.out.println("Total steps taken: " + count);
    
  } // end of main
  
  
  // This function prompts the user for the Circle size (radius), and sets the global variables
  public static boolean circleSize( ) {
    System.out.println("Choose the size of the circle (between 50 to 400)");
    size = CONSOLE.nextInt( );
    while (size < 50 || size > 400) { // Constraints for size
      System.out.println("Chosen size out-of-bounds, please enter a size between 50 to 400");
      size = CONSOLE.nextInt( );
    }
    System.out.println("Circle radius chosen is: " + size);
    PANEL_WIDTH = size * 3; // Adjust the panel to compensate for circle size
    PANEL_HEIGHT = size * 2; // Adjust the panel to compensate for circle size
    return true;
  } // end of circleSize
  
  
  // Function for testing if the string inputted by the user for the color is valid
  public static boolean matchesChoice(String answer) {
    while (true) {
      if (answer.equals("blue") || answer.equals("Blue") || answer.equals("BLUE") || answer.equals("b") || answer.equals("B"))
      return true;
      
      else if (answer.equals("red") || answer.equals("Red") || answer.equals("RED") || answer.equals("r") || answer.equals("R"))
      return true;
      else
        return false;
    }    
  } // end of matchesChoice
  
  
  // Function for prompting the user's circle color
  public static boolean circleColor(Graphics g) {
    System.out.println("Choose the circle color (Blue or Red): ");
    String answer1 = CONSOLE.next( );
    while (matchesChoice(answer1) == false) {
      System.out.println("TRY AGAIN: Choose the circle color (Blue or Red): ");
      answer1 = CONSOLE.next( );
    }
    answer1 = answer1.toUpperCase( );
    
    if (answer1.equals("BLUE")) {
      g.setColor(Color.BLUE);
      System.out.println("Circle color chosen: Blue");
    }
    else if (answer1.equals("RED")) {
      g.setColor(Color.RED);
      System.out.println("Circle color chosen: Red");
    }

    return true;
  } // end of circleColor
  
  
  // Function for prompting the user's walk color
  public static boolean walkColor(Graphics g) {
    System.out.println("Choose the Walking color (Blue or Red): ");
    String answer1 = CONSOLE.next( );
    while (matchesChoice(answer1) == false) {
      System.out.println("TRY AGAIN: Choose the Walking color (Blue or Red): ");
      answer1 = CONSOLE.next( );
    }
    answer1 = answer1.toUpperCase( );
    
    if (answer1.equals("BLUE")) {
      g.setColor(Color.BLUE);
      System.out.println("Walk color chosen: Blue");
    }
    else if (answer1.equals("RED")) {
      g.setColor(Color.RED);
      System.out.println("Walk color chosen: Red");
    }

    return true;
  } // end of walkColor
  
} // end of class