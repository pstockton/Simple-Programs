//////////////////////////////////////////
//
//  Lab VI - Simulating Playoffs
// 
//  By: Patrick Stockton
//
//  Purpose: Calculate percent chance for a team
//     to win a game.
//
//////////////////////////////////////////
import java.util.*;

public class Playoffs {
  public static final Scanner CONSOLE = new Scanner(System.in);
  
  public static void main(String[] args) {
    System.out.println( );
    System.out.println("Lab 6 written by Patrick Stockton\n");
    System.out.println("What are the chances your team (Team 1) will win the game?");
    System.out.println("Pick the percent chance that your team (Team 1) has to win the game!");
    System.out.println("Choose a number between 0 and 100");
    int input = CONSOLE.nextInt( );
    
    // Input the percent chance value
    while (input < 0 || input > 100) {
     System.out.println("Choose a number between 0 and 100"); 
     input = CONSOLE.nextInt( );
    }
    
    Random rand = new Random( );
    System.out.println("Your inputted chance of winning is: " + input + "%");
    
    // Simulate full game
    int game = fullGame(input, rand);
    
  } // end of main
  
  
  // Calculating the chance of winning a single game with random number between 0 and 99
  public static int singleGame(int chance, Random rand) {
    int num1 = rand.nextInt(100);
    int win = 1, loss = 0;
    //System.out.println("Chance: " + chance);
    //System.out.println("Generated number = " + num1);
    if (num1 < chance) {
      //System.out.println("Team 1 won the game!");
      return win;
    }
    else {
      //System.out.println("Team 1 LOST the game!");
      return loss;
    }
    
  } // end of singleGame
  
  
  // Calculating the chance of winning 4 games
  public static int playoffGame(int chance, Random rand) {
    int game = 0, win = 0, loss = 0, team1 = 1, team2 = 0;
    
    while(win < 4 && loss < 4) {
      game = singleGame(chance, rand);
      
      if (game == 1) {
        win++;
        //System.out.println("Win count = " + win);
      }
      else if (game == 0) {
        loss++;
        //System.out.println("Loss count = " + loss);
      } 
    }
        
    if (win == 4)
      return team1;
    else
      return team2;

  } // end of playoffGame
  
  
  // Calculating the chance of a full game (10 playoffs, 40 single games)
  public static int fullGame(int chance, Random rand) {
    int game = 0, win = 0, loss = 0, team1 = 1, team2 = 0;
    
    while (win < 10 && loss < 10) {
      game = playoffGame(chance, rand);
      
      if (game == 1) {
        win++;
        System.out.print(game + " ");
      }
      
      else if (game == 0) {
        loss++;
        System.out.print(game + " ");
      }
    }
    
    System.out.println( );
    System.out.println("********** FINAL RESULTS **********");
    System.out.println("Team 1 wins: " + win);
    System.out.println("Team 2 wins:  " + loss);
    if (win == 10)
      System.out.println("THE WINNER IS <<<TEAM 1>>>");
    else if (loss == 10)
      System.out.println("THE WINNER IS <<<TEAM 2>>>");
          
    return game;
  } // end of fullGame
  
} // end of class