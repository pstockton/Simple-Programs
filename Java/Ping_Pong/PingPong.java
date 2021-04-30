//////////////////////////////////////////////////////
//     EE 5123 - Final Project
//
//     By: Patrick Stockton
//
//     Class: Ping Pong
//////////////////////////////////////////////////////

import java.io.*;
import java.awt.*;
import java.util.*;

public class PingPong {
  public static final int PANEL_WIDTH = 500; // "Width" global constant variable
  public static final int PANEL_HEIGHT = 400; // "Height" global constant variable
  public static final int SLEEP_TIME = 50; // "Sleep" global constant variable
  public static final int BALL_SIZE = 10; // "Ball Size" global constant variable
  public static final Color BALL_COLOR = Color.RED; // "Ball Color" global constant variable
  public static int ballX, ballY; // Ball coordinates instantiation, global class variables
  public static final Color BACKGROUND_COLOR = Color.WHITE; // "Background Color" global constant variable
  public static int ballVelocityX, ballVelocityY; // Ball moving global class variables
  public static final int KEY_SPACE = ' '; // Integer constant for "space key" identification
  public static final int PADDLE_LENGTH = 50; // Length of Paddle
  public static final int AI_paddle_length = 50; // Length of computer's paddle
  public static final int PADDLE_X = 460; // Paddle stays 40 pixels from right side of panel
  public static final int AI_paddleX = 40; // Starting location for computer's paddle on panel
  public static int paddleY; // Initilization of Paddle's Y coordinate
  public static int AI_paddleY;
  public static final int AI_paddle_maxspeed = 2;
  public static final Color PADDLE_COLOR = Color.BLACK; // Paddle's Color
  public static final int UP_ARROW = 38; // Integer constant for "Up Arrow key" identification
  public static final int DOWN_ARROW = 40; // Integer constant for "Down Array key" identification
  public static final int PADDLE_MOVE_AMOUNT = 5; // Integer for the amount the paddle moves
  public static int init_ball_velx = 4; 
  public static int init_ball_vely = 3;
  public static int AI_score, USER_score, targetscore; // Scores for both the AI and user, and target score
  public static boolean go = true;
  public static final Color Score_Color = Color.BLUE; // Score Color
  public static Font normalFont;
  public static Font scoreFont;
  public static final int SCORES_FONT_SIZE = 30;
  public static final int MIN_X_VELOCITY = -2, MAX_X_VELOCITY = 4; // Starting min and max X velocity of the ball
  public static final int MIN_Y_VELOCITY = -2, MAX_Y_VELOCITY = 3; // Starting min and max Y velcoity of the ball
  
  public int ballspeed = 0;
  
  public static void main(String[] args) {
    
    // Reading the data files from the config.txt file
    try {
      PingPong obj = new PingPong();
      obj.readConfig(args); // Reading config file
    } catch (Exception e) {
      e.printStackTrace();
    }
    //readConfig(args);
      DrawingPanel panel = new DrawingPanel(PANEL_WIDTH, PANEL_HEIGHT);
        Graphics g = panel.getGraphics( );
        g.drawString("EE 5123 Project by Patrick Stockton", 150, 15); // Print name on screen/panel
        g.drawString("AI Score", 150, 50);
        g.drawString("User Score", 250, 50);
        
        ballX = 250; // Ball origin coordinates
        ballY = 200; // Ball origin coordinates
        ballVelocityX = 0; // Initial ball velocity (X)
        ballVelocityY = 0; // Initial ball velocity (Y)
        paddleY = 175; // Set paddle at center of Y axis
        AI_paddleY = 175; // Set AI paddle at center of Y axis
        
        drawBall(g, BALL_COLOR); // Ball drawing call
        drawPaddle(g, PADDLE_COLOR);
        
        normalFont = g.getFont();
        scoreFont = new Font(normalFont.getName(), normalFont.getStyle(), SCORES_FONT_SIZE);
        
        startGame(panel, g);  
  } // end of main
  
 
  // Reads the configuration file and imports settings
  public static void readConfig(String[] args) throws Exception {
    String infile = "C:\\Users\\patri\\Desktop\\PingPong\\Config.txt";
    String line;
    String username = "", backgroundcolor = "";
    int ballspeed2 = 0, endscore = 0;
    
    // Read from file
    try {
     FileReader freader = new FileReader(infile);
     BufferedReader in = new BufferedReader(freader);
     
     // Scan text file
     while((line = in.readLine()) != null) {
       System.out.println(line);
       if (((line.substring(0,4)).equals("Name"))) {
         username = line.substring(7); // begin at start of name entry field
       }
       if (((line.substring(0,10)).equals("Ball Speed"))) {
         ballspeed2 = Integer.parseInt(line.substring(13)); // convert to int
       }
       if (((line.substring(0,10)).equals("Back Color"))) {
         backgroundcolor = line.substring(13); // background color
       }
       if (((line.substring(0,4)).equals("Stop"))) {
         targetscore = Integer.parseInt(line.substring(16)); // target end score for round/game to end
       }
     }
     
     in.close(); // close config file
     System.out.println("EOF Reached!");
     }
    
    catch(IOException f) {
     System.out.println("ERROR Found " + f); 
    }
    
    System.out.println("User name is: " + username);
    System.out.println("Ball Speed is: " + ballspeed2);
    System.out.println("Background Color is: " + backgroundcolor);
    System.out.println("End Score Goal is: " + endscore + " points!");
  } // end of readConfig
  
  
  // Function for running/refreshing the game
  public static void startGame(DrawingPanel panel, Graphics g) {
    int x = 0;
    int y = 270;
    int deltaX = 1;
    int deltaY = 0;
    //targetscore = 2;
    //boolean go = true;
    
    while (go == true) {
      handleKeys(panel, g);
        panel.sleep(50);
        moveBall(g);
        detectHit( );
        movePaddle(g, deltaY);
        movePaddleAI(g, deltaY);
        //displayScore(g, Score_Color);
    }
   } // end of startGame
    
    
  // Function for creating a ball of color "c"
  public static void drawBall(Graphics g, Color c) {
    g.setColor(c);
    g.fillOval(ballX, ballY, BALL_SIZE, BALL_SIZE);
      
  } // end of drawBall
    
    
  // Function for moving the ball
  public static void moveBall(Graphics g) {
    drawBall(g, BACKGROUND_COLOR); // erase ball
    displayScore(g, BACKGROUND_COLOR); // Score erase
    ballX = ballX + ballVelocityX; // set new X coordinate (increment)
    ballY = ballY + ballVelocityY; // set new Y coordinate (increment)
    drawBall(g, BALL_COLOR);
    displayScore(g, Score_Color); // Draw score color
    
    if (ballX < -10) {
      displayScore(g, BACKGROUND_COLOR);
      USER_score++;
      drawBall(g, BACKGROUND_COLOR);
      resetBall(g);
    }
    if (ballX > 500) {
      displayScore(g, BACKGROUND_COLOR);
      AI_score++;
      drawBall(g, BACKGROUND_COLOR);
      resetBall(g);
    }
  } // end of moveBall
    
    
  // Function for resetting the ball
  public static void resetBall(Graphics g) {
    drawBall(g, BACKGROUND_COLOR);
    ballX = 250;
    ballY = 200;
    //randomGen();
    ballVelocityX = init_ball_velx; // Default speed = 4
    ballVelocityY = init_ball_vely; // Default speed = 1
    drawBall(g, BALL_COLOR);
    
  } // end of resetBall
    
    
  // Function for receiving keyboard inputs
  public static void handleKeys(DrawingPanel panel, Graphics g) {
    int keyCode = panel.getKeyCode( );
    if (keyCode == KEY_SPACE)
      resetBall(g);
    else if (keyCode == UP_ARROW)
      movePaddle(g, -PADDLE_MOVE_AMOUNT);
    else if (keyCode == DOWN_ARROW)
      movePaddle(g, PADDLE_MOVE_AMOUNT);
    
  } // end of handleKeys
  
    
  // Function for creating the Paddle
  public static void drawPaddle(Graphics g, Color c) {
    g.setColor(c);
    g.drawLine(PADDLE_X, paddleY, PADDLE_X, paddleY + PADDLE_LENGTH);
  } // end of drawPaddle

  
  // Function for creating the AI's Paddle
  public static void drawPaddleAI(Graphics g, Color c) {
    g.setColor(c);
    g.drawLine(AI_paddleX, AI_paddleY, AI_paddleX, AI_paddleY + AI_paddle_length);
  } // end of drawPaddle
  
    
  // Function for moving the Paddle
  public static void movePaddle(Graphics g, int deltaY) {
    drawPaddle(g, BACKGROUND_COLOR);

    if (paddleY < 400 && paddleY > 0)
      paddleY = paddleY + deltaY;
    if (paddleY >= 380)      // Prevent paddle from going off the bottom of the panel
      paddleY = paddleY - 1;   // If paddle is moving off bottom panel, push up by 1
    if (paddleY <= 0)        // Prevent paddle from going off the top of the panel
      paddleY = paddleY + 1;   // If paddle is moving off top panel, push down by 1
    
    drawPaddle(g, PADDLE_COLOR);
    //drawPaddleAI(g, PADDLE_COLOR);
     
  } // end of movePaddle
    
  
  // Function for moving the AI's Paddle
  public static void movePaddleAI(Graphics g, int deltaY) {
    drawPaddleAI(g, BACKGROUND_COLOR);
    //deltaY = 5;
    if (AI_paddleY < ballY - 10)
      AI_paddleY = AI_paddleY + AI_paddle_maxspeed;
    if (AI_paddleY >= ballY - 10)      // Prevent paddle from going off the bottom of the panel
      AI_paddleY = AI_paddleY - AI_paddle_maxspeed;   // If paddle is moving off bottom panel, push up by 1
    //if (paddleY <= 0)        // Prevent paddle from going off the top of the panel
      //paddleY = paddleY + 1;   // If paddle is moving off top panel, push down by 1
    
    drawPaddleAI(g, PADDLE_COLOR);
     
  } // end of movePaddleAI
  
    
  // Function for detecting collisions
  public static void detectHit( ) {
    
    // Paddle collision detection
    //if (ballVelocityX > 0 && (ballY >= paddleY - 10 && ballY <= paddleY + PADDLE_LENGTH) && ballX == PADDLE_X - 10)
      //ballVelocityX = -ballVelocityX;
    if (ballVelocityX > 0 && (ballY >= paddleY - 5 && ballY <= paddleY + PADDLE_LENGTH - 50) && ballX == PADDLE_X - 10)
      ballVelocityX = -9;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH - 44) && ballX == PADDLE_X - 10)
      ballVelocityX = -8;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH - 38) && ballX == PADDLE_X - 10)
      ballVelocityX = -7;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH - 32) && ballX == PADDLE_X - 10)
      ballVelocityX = -6;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH - 26) && ballX == PADDLE_X - 10)
      ballVelocityX = -5;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH - 20) && ballX == PADDLE_X - 10)
      ballVelocityX = -4;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH - 14) && ballX == PADDLE_X - 10)
      ballVelocityX = -3;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH - 8) && ballX == PADDLE_X - 10)
      ballVelocityX = -2;
    if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH) && ballX == PADDLE_X - 10)
      ballVelocityX = -1;
      
    if (ballY >= 400 || ballY <= 0) // Top and Bottom boundary collision detection
      ballVelocityY = -ballVelocityY;
    if (ballVelocityX < 0 && (ballY >= AI_paddleY && ballY <= AI_paddleY + AI_paddle_length) && ballX == AI_paddleX - 10)
      ballVelocityX = 4;
    
  } // end of detectHit
  
  
  // Display scores
  public static void displayScore(Graphics g, Color col) {
    g.setColor(col);
    g.setFont(scoreFont);
    g.drawString(" " + AI_score, 150, 85);
    g.drawString(" " + USER_score, 265, 85);
    
    // Test to see if the final score is reached
    if (AI_score == targetscore) {
     g.drawString("GAME OVER!", 150, 200);
     g.drawString("AI has won!", 150, 250);
     go = false;
    }
    else if (USER_score == targetscore) {
     g.drawString("GAME OVER!", 150, 200);
     g.drawString("User has won!", 150, 250);
     go = false;
    }
  } // end of displayScore
  
  
  // Generate random velocities
  public static void randomGen( ) {
    Random rand = new Random();
    
    init_ball_velx = MIN_X_VELOCITY + rand.nextInt(MAX_X_VELOCITY);
    init_ball_vely = MIN_Y_VELOCITY + rand.nextInt(MAX_Y_VELOCITY);
    System.out.println("init_ball_velx = " + init_ball_velx);
    System.out.println("init_ball_vely = " + init_ball_vely);
    System.out.println("========");
  } // end of randomGen
  
} // end of class