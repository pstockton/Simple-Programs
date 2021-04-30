//////////////////////////////////////////
//
//  Lab IV - Hyperbola
// 
//  By: Patrick Stockton
//
//  Purpose: Drawing a hyperbola using
//           drawingpanel
//
//////////////////////////////////////////
import java.awt.*;

public class Hyperbola {
  
  // The width and height of the DrawingPanel
  public static final int PANEL_SIZE = 512; 
  public static final int INC8 = 8; // Incrementing variable of value 8
  public static final int INC32 = 32; // Incrementing variable of value 32
  
  
  public static void main(String[] args) {
    DrawingPanel panel = new DrawingPanel(PANEL_SIZE, PANEL_SIZE);
    Graphics g = panel.getGraphics( );

    System.out.println("Lab 4 written by Patrick Stockton");
    
    // Drawing the lower grid
    for (int i = 0; i < PANEL_SIZE; i = i + INC32) {
      g.drawLine(0, i, i, PANEL_SIZE);
    } // end for loop
    
    // Drawing the upper grid
    for (int i = 0; i < PANEL_SIZE; i = i + INC8) {
      g.drawLine(i, 0, PANEL_SIZE, i);
    } // end for loop
    
  } // end of main
  
} // end of Hyperbola class