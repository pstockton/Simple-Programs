`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 8-bit Carry Look Ahead Adder Test Bench
//
//  By: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////

// Test Bench Code for the 8-bit CLA
module CLA8bit_tb( );
        
    reg [7:0] A, B;
    reg Cin;
    wire Cout, GG, PG;
    wire [7:0] S;

    CLA8bit uut(.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout),.GG(GG),.PG(PG));
    
    initial 
    begin 
    
    A = 8'b00000000;
    B = 8'b00000000;
    Cin = 1'b0;
  
    #100;
    A = 8'b00000001;
    B = 8'b11111111;
    Cin = 1'b0;
 
    #50;
    A = 8'b00000000;
    B = 8'b11110001;
    Cin = 1'b1;
    
    #50;
    A = 8'b00000111;
    B = 8'b1111000;
    Cin = 1'b1;
    
    #50;
    A = 8'b00000110;
    B = 8'b00000001;
    Cin = 1'b0;

    #50;
    A = 8'b00000000;
    B = 8'b11111111;
    Cin = 1'b0;
       
    end

endmodule