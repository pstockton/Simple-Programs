////////////////////////////////////////////
//
//   Project II - Semi-Pong
//
//   by: Patrick Stockton
//
//   This program creates a graphics simulation in which
//   a red pong ball moves across the screen, and a paddle
//   is able to deflect the ball.
////////////////////////////////////////////
import java.awt.*;

public class Project2 {
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
  public static final int PADDLE_X = 460; // Paddle stays 40 pixels from right side of panel
  public static int paddleY; // Initilization of Paddle's Y coordinate
  public static final Color PADDLE_COLOR = Color.BLACK; // Paddle's Color
  public static final int UP_ARROW = 38; // Integer constant for "Up Arrow key" identification
  public static final int DOWN_ARROW = 40; // Integer constant for "Down Array key" identification
  public static final int PADDLE_MOVE_AMOUNT = 5; // Integer for the amount the paddle moves
  
    public static void main(String[] args) {
      DrawingPanel panel = new DrawingPanel(PANEL_WIDTH, PANEL_HEIGHT);
        Graphics g = panel.getGraphics( );
        g.drawString("Project 2 by Patrick Stockton", 10, 15); // Print name on screen/panel
        
        ballX = 250; // Ball origin coordinates
        ballY = 200; // Ball origin coordinates
        ballVelocityX = 0; // Initial ball velocity (X)
        ballVelocityY = 0; // Initial ball velocity (Y)
        paddleY = 175; // Set paddle at center of Y axis
        
        drawBall(g, BALL_COLOR); // Ball drawing call
        drawPaddle(g, PADDLE_COLOR);
        
        startGame(panel, g);
        
    } // end of main
    
    public static void startGame(DrawingPanel panel, Graphics g) {
        int x = 0;
        int y = 270;
        int deltaX = 1;
        int deltaY = 0;
        for (int time = 0; time <= 1000; time++) { // Default time = 1000
          handleKeys(panel, g);
            panel.sleep(50);
            moveBall(g);
            detectHit( );
            movePaddle(g, deltaY);
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
      ballX = ballX + ballVelocityX; // set new X coordinate (increment)
      ballY = ballY + ballVelocityY; // set new Y coordinate (increment)
      drawBall(g, BALL_COLOR);
      
     /* if (ballX > 500 || ballY > 400) { // test if ball goes out-of-bounds
        ballX = 250;
        ballY = 200;
      } */
      if (ballX < -10) {
        drawBall(g, BACKGROUND_COLOR);
        resetBall(g);
      }
      //g.drawOval(ballX = ballX + ballVelocityX, ballY = ballY + ballVelocityY, BALL_SIZE, BALL_SIZE);
    } // end of moveBall
    
    
    // Function for resetting the ball
    public static void resetBall(Graphics g) {
      drawBall(g, BACKGROUND_COLOR);
      ballX = 250;
      ballY = 200;
      ballVelocityX = 1; // Default speed = 1
      ballVelocityY = 1; // Default speed = 1
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
    
    
    // Function for moving the Paddle
    public static void movePaddle(Graphics g, int deltaY) {
      drawPaddle(g, BACKGROUND_COLOR);
      //deltaY = 5;
      if (paddleY < 400 && paddleY > 0)
        paddleY = paddleY + deltaY;
      if (paddleY >= 380)      // Prevent paddle from going off the bottom of the panel
        paddleY = paddleY - 1;   // If paddle is moving off bottom panel, push up by 1
      if (paddleY <= 0)        // Prevent paddle from going off the top of the panel
        paddleY = paddleY + 1;   // If paddle is moving off top panel, push down by 1
      
      drawPaddle(g, PADDLE_COLOR);
      
    } // end of movePaddle
    
    
    // Function for detecting collisions
    public static void detectHit( ) {
      
      // Paddle collision detection
      if (ballVelocityX > 0 && (ballY >= paddleY && ballY <= paddleY + PADDLE_LENGTH) && ballX == PADDLE_X - 10)
        ballVelocityX = -ballVelocityX;
      if (ballY >= 400 || ballY <= 0) // Top and Bottom boundary collision detection
        ballVelocityY = -ballVelocityY;
      //if (ballX <= 0) // Left edge boundary collision detection
      //  ballVelocityX = -ballVelocityX;        
      
    } // end of detectHit
} // end of class