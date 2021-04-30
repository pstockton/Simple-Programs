/*
 * EE 5453 - Assignment 4
 *
 * by: Patrick Stockton
 */

package parkinglot;

import java.awt.event.*;
import java.awt.Color;
import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.Graphics;
import java.awt.Font;
import java.awt.Polygon;
import java.awt.Graphics2D;
import java.awt.*;
import javax.swing.*;
import java.awt.geom.AffineTransform;

public class ParkingLot {


    public static void main(String[] args) {
        
        JFrame frame = new JFrame("Parking Lot Simulation");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        ColorJPanel colorJPanel = new ColorJPanel();
        frame.add(colorJPanel);
        frame.setSize(800, 800);
        frame.setVisible(true);
    }
       
}

class ColorJPanel extends JPanel{
    int i = 0;
    int y = 360;
    boolean go = true;
    boolean rot = false;
    boolean park = false;
    boolean restart = false;
    
    public void paintComponent(Graphics g){
        super.paintComponent(g);
       
        Graphics2D g2d = (Graphics2D)g;
        Rectangle rect = new Rectangle(35,100,35,80);
        Rectangle rect2 = new Rectangle(50,58,80,35);

        g2d.translate(250, 200);
        g2d.setColor(Color.BLACK);
        
        // Creating the parking lot layout
        g2d.fill(new Rectangle(300, 0, 1, 300)); // Right border line
        g2d.fill(new Rectangle(0, 0, 1, 300)); // Left border line
        for (int x = 0; x <= 300; x = x + 50) {
            g2d.fill(new Rectangle(0, x, 100, 1)); // Creating left parking lines
            g2d.fill(new Rectangle(200, x, 100, 1)); // Creating right parking lines
        }

        /*g2d.fill(new Rectangle(0, 0, 1, 300)); // Left border line
        g2d.fill(new Rectangle(0, 300, 100, 1)); // Left line 0
        g2d.fill(new Rectangle(0, 250, 100, 1)); // Left line 1
        g2d.fill(new Rectangle(0, 200, 100, 1)); // Left line 2
        g2d.fill(new Rectangle(0, 150, 100, 1)); // Left line 3
        g2d.fill(new Rectangle(0, 100, 100, 1)); // Left line 4
        g2d.fill(new Rectangle(0, 50, 100, 1)); // Left line 5
        g2d.fill(new Rectangle(0, 0, 100, 1)); // Left line 6
        g2d.fill(new Rectangle(0, 0, 100, 1)); // Left line 7
        
        g2d.fill(new Rectangle(300, 0, 1, 300)); // Right border line
        g2d.fill(new Rectangle(200, 300, 100, 1)); // Right line 0
        g2d.fill(new Rectangle(200, 250, 100, 1)); // Right line 1
        g2d.fill(new Rectangle(200, 200, 100, 1)); // Right line 2
        g2d.fill(new Rectangle(200, 150, 100, 1)); // Right line 3
        g2d.fill(new Rectangle(200, 100, 100, 1)); // Right line 4
        g2d.fill(new Rectangle(200, 50, 100, 1)); // Right line 5
        g2d.fill(new Rectangle(200, 0, 100, 1)); // Right line 6
        g2d.fill(new Rectangle(200, 0, 100, 1)); // Right line 7
        */
        
        // Beginning the start of the simulation
        // The car approaches from the bottom to the top
        if (go == true) {
        y-=1; 
        if (y==0) rot = true;
        //g2d.rotate(Math.toRadians(i));
        g2d.translate(100, y);
        g2d.setColor(Color.RED);
        g2d.fill(rect);
        
        }

        // Once the parking space is located, the car begins to rotate
        if (rot == true) {
            go = false;
            i+=1;
            if (i > 80) park = true;
            //g2d.rotate(Math.toRadians(i), Math.toRadians(25), Math.toRadians(100));
            g2d.rotate(Math.toRadians(i));
            g2d.translate(i-100, i-100);
            //g2d.rotate(Math.toRadians(20), Math.toRadians(20), Math.toRadians(100));
            //g2d.rotate(Math.toDegrees(i));
            g2d.setColor(Color.RED);
            g2d.fill(rect);
        }
        
        // After the rotation is complete, pull into the parking space
        if (park == true) {
            rot = false;
            i+=1;
            if (i > 150) park = false; 
            g2d.translate(i, 50);
            g2d.setColor(Color.RED);
            g2d.fill(rect2);
        }   
        
    }
    public ColorJPanel() {
        ActionListener animate = new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                repaint();
            }
        };
        Timer timer = new Timer(15 ,animate);
        timer.start();
    }



}





