//////////////////////////////////////////
//
//  Lab 1 - Poem
// 
//  By: Patrick Stockton
//
//  Purpose: Print the verses of the poems;
//  "Mary Had a Little Lamb" and
//  "This Old Man"
//////////////////////////////////////////

public class Poems {
  public static void main(String[] args) {
    
    // Title
    System.out.println("Lab 1 written by Patrick Stockton");
    System.out.println( );
    
    // Print (call) each poem verse(s)
    Mary( );
    OldMan( );
    
  }
  
  
  
  ///////////// Mary Had a Little Lamb ///////////////
  // Function for "Mary Had a Little Lamb" first verse
  public static void Mary( ) {    
    System.out.println("\t\"Mary Had a Little Lamb\"");
    MaryL1( );
    MaryL2( );
    MaryL1( );
    MaryL3( );
    System.out.println( );  
  }
  
  // Method for Mary first line
  public static void MaryL1( ) {
    System.out.println("Mary had a little lamb,");
  }
  
  // Method for Mary second line
  public static void MaryL2( ) {
    System.out.println("Little lamb, little lamb,");
  }
  
  // Method for Mary fourth line (end of first verse)
  public static void MaryL3( ) {
    System.out.println("Its fleece was white as snow");
  }
  
  
  /////////////// This Old Man ///////////////
  // Function for "This Old Man"
  public static void OldMan( ) {    
    System.out.println("\t\"This Old Man\"");
    OldManV1( );
    OldManV2( );
    OldManV3( );
  }
  
  // OldMan First Verse
  public static void OldManV1( ) {
    System.out.println("This old man, he played one");
    System.out.println("He played knick-knack on my thumb");
    OldManRefrain( );
  }
  
  // OldMan Second Verse
  public static void OldManV2( ) {
    System.out.println("This old man, he played two");
    System.out.println("He played knick-knack on my shoe");
    OldManRefrain( );
  }
  
  // OldMan Third Verse
  public static void OldManV3( ) {
    System.out.println("This old man, he played three");
    System.out.println("He played knick-knack on my knee");
    OldManRefrain( );
  }
  
  // OldMan Refrain (repeated lines)
  public static void OldManRefrain( ) {
    System.out.println("With a knick-knack patty-whack, give a dog a bone");
    System.out.println("This old man came rolling home");
    System.out.println( );
  }
}