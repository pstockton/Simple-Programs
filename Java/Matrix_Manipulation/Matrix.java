/* EE 5453 - Engr. Programming II
 * 
 * by: Patrick Stockton
 * 
 * Assignment II
 * 
 * */
import java.util.*;
import java.text.*;
import java.util.Arrays;

class Matrix {
  
  public static void main(String[] args) {
    int[][] matA = {{1, 2, 3}, {6, 5, 7}, {4, 8, 9}};
    int[][] matB = {{0, 1, 4}, {2, 3, 8}, {0, 2, 3}};
    
    matAdd(matA, matB);
    matMult(matA, matB);
    System.out.print("\nThe inverse of matA is: ");
    matInv(matA);
    System.out.print("\nThe inverse of matB is: ");
    matInv(matB);
    System.out.print("\nThe values in matA are: ");
    matShow(matA);
    System.out.print("\nThe values in matB are: ");
    matShow(matB);
    
    // Using arrays.fill as a main method to fill an 3x3 array
    // Have to fill each row at a time
    for (int i = 0; i < matA.length; i++) {
     Arrays.fill(matA[i], 0); 
    }
    System.out.print("Filled array below: ");
    matShow(matA);
    
  } // end of main
  
  // Function for adding two 3x3 matrices
  public static void matAdd(int[][] matA, int[][] matB) {
    int[][] sum = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
    
    System.out.println("Adding two matrices: ");
    for (int x = 0; x < 3; x++) {
      System.out.print("Row: " + x + " -->| ");
      for (int y = 0; y < 3; y++) {
        sum[x][y] = matA[x][y] + matB[x][y];
        System.out.print(" " + sum[x][y]);
      }
      System.out.println( );
    }
  } // end of matAdd
  
  // Function for multiplying two 3x3 matrices
  public static void matMult(int[][] matA, int[][] matB) {
   int[][] mult = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
    
   System.out.println( );
   System.out.println("Multiplying two matrices: ");
    for (int x = 0; x < 3; x++) {
      System.out.print("Row: " + x + " -->| ");
      for (int y = 0; y < 3; y++) {
        mult[x][y] = matA[x][y] * matB[x][y];
        System.out.print(" " + mult[x][y]);
      }
      System.out.println( );
    } 
    System.out.println( );
  } // end of matMult
  
  // Function for inverting a 3x3 matrix
  public static void matInv(int[][] mat) {
    DecimalFormat numberFormat = new DecimalFormat("#.0000");
    double det = 0;
    double[][] newMat = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}}; // Holds inverted matrix values
    
    // Casting input array into double
    double[][] newMat2 = new double[mat.length][mat[0].length];
    for (int i = 0; i < mat.length; i++) {
      for (int j = 0; j < mat[0].length; j++) {
       newMat2[i][j] = (double) mat[i][j];
      }
    }

    // Calculating the determinant of the matrix
    det = newMat2[0][0]*(newMat2[1][1] * newMat2[2][2] - newMat2[1][2] * newMat2[2][1]) 
          - newMat2[0][1]*(newMat2[1][0] * newMat2[2][2] - newMat2[1][2] * newMat2[2][0])
          + newMat2[0][2]*(newMat2[1][0] * newMat2[2][1] - newMat2[1][1] * newMat2[2][0]);
    
    // Manually calculating the new inverted matrix value using the determinant
    newMat[0][0] = (newMat2[1][1] * newMat2[2][2] - newMat2[1][2] * newMat2[2][1]) / det;
    newMat[0][1] = (newMat2[0][2] * newMat2[2][1] - newMat2[0][1] * newMat2[2][2]) / det;
    newMat[0][2] = (newMat2[0][1] * newMat2[1][2] - newMat2[0][2] * newMat2[1][1]) / det;
    newMat[1][0] = (newMat2[1][2] * newMat2[2][0] - newMat2[1][0] * newMat2[2][2]) / det;
    newMat[1][1] = (newMat2[0][0] * newMat2[2][2] - newMat2[0][2] * newMat2[2][0]) / det;
    newMat[1][2] = (newMat2[0][2] * newMat2[1][0] - newMat2[0][0] * newMat2[1][2]) / det;
    newMat[2][0] = (newMat2[1][0] * newMat2[2][1] - newMat2[1][1] * newMat2[2][0]) / det;
    newMat[2][1] = (newMat2[0][1] * newMat2[2][0] - newMat2[0][0] * newMat2[2][1]) / det;
    newMat[2][2] = (newMat2[0][0] * newMat2[1][1] - newMat2[0][1] * newMat2[1][0]) / det;
    System.out.println("Determinant of matrix equals : " + det);

    System.out.println("The inverted matrix is: ");
    // Printing out the inverted matrix with set decimal precision
    for (int i = 0; i < mat.length; i++) {
      System.out.print("|");
      for (int j = 0; j < mat[0].length; j++) {
       System.out.print(numberFormat.format(newMat[i][j]) + "|");
      }
      System.out.println( );
    }
  } // end of matInv
  
  // Function for displaying a 3x3 matrix
  public static void matShow(int[][] mat) {
   System.out.println( );
    for (int x = 0; x < 3; x++) {
      System.out.print("|");
      for (int y = 0; y < 3; y++) {
        System.out.print(mat[x][y] + "|");
      }
      System.out.println( );
    } 
    System.out.println( );
  } // end of matMult
  
} // end of Matrix