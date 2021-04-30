//////////////////////////////////////////
//
//  Lab V - Drawing and Comparing Circles
// 
//  By: Patrick Stockton
//
//  Purpose: Drawing and Comparing Circles
//
//////////////////////////////////////////
import java.awt.*;
import java.util.*;

public class Circles {
  public static final Scanner CONSOLE = new Scanner(System.in);
  public static final int PANEL_WIDTH = 400; // Panel Width
  public static final int PANEL_HEIGHT = 300; // Panelth Height
  public static int Cx1 = 0, Cy1 = 0, Radius1 = 0; // x, y, and Radius for first Circle
  public static int Cx2 = 0, Cy2 = 0, Radius2 = 0; // x, y, and Radius for second Circle
  public static int Cx3 = 0, Cy3 = 0, Radius3 = 0; // x, y, and Radius for third Circle
  public static int output; 
  
  
  public static void main(String[] args) {
    System.out.println("\n\nLab 5 written by Patrick Stockton \n");
    DrawingPanel panel = new DrawingPanel(PANEL_WIDTH, PANEL_HEIGHT); // Panel size: 400x300
    Graphics g = panel.getGraphics( );
    
    drawCircle1(g);
    drawCircle2(g);
    drawCircle3(g);
    
    // Comparing BLUE and GREEN Circles
    if (sizeComparison(Radius1, Radius2) == -1)
      System.out.println("The BLUE circle is SMALLER than the GREEN circle.");
    else if (sizeComparison(Radius1, Radius2) == 0)
      System.out.println("The BLUE circle is the SAME size as the GREEN circle.");
    else if (sizeComparison(Radius1, Radius2) == 1)
      System.out.println("The BLUE circle is LARGER than the GREEN circle.");
    
    // Comparing BLUE and RED
    if (sizeComparison(Radius1, Radius3) == -1)
      System.out.println("The BLUE circle is SMALLER than the RED circle.");
    else if (sizeComparison(Radius1, Radius3) == 0)
      System.out.println("The BLUE circle is the SAME size as the RED circle.");
    else if (sizeComparison(Radius1, Radius3) == 1)
      System.out.println("The BLUE circle is LARGER than the RED circle.");
      
    // Comparing GREEN and RED
    if (sizeComparison(Radius2, Radius3) == -1)
      System.out.println("The GREEN circle is SMALLER than the RED circle.");
    else if (sizeComparison(Radius2, Radius3) == 0)
      System.out.println("The GREEN circle is the SAME size as the RED circle.");
    else if (sizeComparison(Radius2, Radius3) == 1)
      System.out.println("The GREEN circle is LARGER than the RED circle.");
      
    // Testing if BLUE intersects GREEN
    output = intersectTest(Radius1, Cx1, Cy1, Radius2, Cx2, Cy2);
    if(output == 1) {
      System.out.println("The BLUE circle intersects the GREEN circle"); }
    else if(output == 0) { 
      System.out.println("The BLUE circle does not intersect the GREEN circle"); }
    
    // Testing if BLUE intersects RED
    output = intersectTest(Radius1, Cx1, Cy1, Radius3, Cx3, Cy3);
    if(output == 1) {
      System.out.println("The BLUE circle intersects the RED circle"); } 
    else if(output == 0) {
      System.out.println("The BLUE circle does not intersect the RED circle"); }
    
    // Testing if GREEN intersects RED
    output = intersectTest(Radius2, Cx2, Cy2, Radius3, Cx3, Cy3);
    if(output == 1) { 
      System.out.println("The GREEN circle intersects the RED circle"); }
    else if(output == 0) {
      System.out.println("The GREEN circle does not intersect the RED circle"); } 

  } // end of main
  
  // Function for drawing the first (BLUE) circle
  public static void drawCircle1(Graphics g) {
    System.out.println("---------- BLUE Circle ----------");
    System.out.println("Blue Circle x: ");
    Cx1 = CONSOLE.nextInt( );
    System.out.println("Blue Circle y: ");
    Cy1 = CONSOLE.nextInt( );
    System.out.println("Value of the Blue Circle Radius: ");
    Radius1 = CONSOLE.nextInt( );
    
    g.setColor(Color.BLUE);
    g.fillOval(Cx1, Cy1, Radius1, Radius1);
    System.out.print("BLUE Circle: (" + Cx1 + ", " + Cy1 + ") ");
    System.out.println(" with Radius = " + Radius1);
  } // end of drawCircle1
  
  // Function for drawing the second (GREEN) circle
  public static void drawCircle2(Graphics g) {
    System.out.println("---------- GREEN Circle ----------");
    System.out.println("Green Circle x: ");
    Cx2 = CONSOLE.nextInt( );
    System.out.println("Green Circle y: ");
    Cy2 = CONSOLE.nextInt( );
    System.out.println("Value of the Green Circle Radius: ");
    Radius2 = CONSOLE.nextInt( );
    
    g.setColor(Color.GREEN);
    g.fillOval(Cx2, Cy2, Radius2, Radius2);
    System.out.print("GREEN Circle: (" + Cx2 + ", " + Cy2 + ") ");
    System.out.println(" with Radius = " + Radius2);
  } // end of drawCircle2
  
  // Function for drawing the third (RED) circle
  public static void drawCircle3(Graphics g) {
    System.out.println("---------- RED Circle ----------");
    System.out.println("Red Circle x: ");
    Cx3 = CONSOLE.nextInt( );
    System.out.println("Red Circle y: ");
    Cy3 = CONSOLE.nextInt( );
    System.out.println("Value of the Red Circle Radius: ");
    Radius3 = CONSOLE.nextInt( );
    
    g.setColor(Color.RED);
    g.fillOval(Cx3, Cy3, Radius3, Radius3);
    System.out.print("RED Circle: (" + Cx3 + ", " + Cy3 + ") ");
    System.out.println(" with Radius = " + Radius3);
  } // end of drawCircle3
  
  
  // Function for comparing the size of two circles
  public static int sizeComparison(int r1, int r2) {
    if (r1 < r2)
      return -1;
    else if (r1 == r2)
      return 0;
    else
      return 1;
  } // end of sizeComparison
  
  // Function for determing if circles intersect
  public static int intersectTest(int CirR1,int CirX1,int CirY1,int CirR2,int CirX2,int CirY2 ) {
    int distance = ((CirX1 - CirX2) * (CirX1 - CirX2)) + ((CirY1 - CirY2) * (CirY1 - CirY2));
    int rdistance = CirR1 + CirR2;
    
    if(distance <= rdistance) {
      output = 1; }
    else if(distance > rdistance) {
      output = 0; }
    return output;
  } // end of intersectTest
  
  
} // end of class