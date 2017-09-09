`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16 x 16 Array Multiplier Test Bench
//
//  by: Patrick Stockton
//          
//
// 
//////////////////////////////////////////////////////////////////////////////////


module ArrayMultiplier_16x16_tb();

    reg [15:0] A, B;
    wire [31:0] P;
    
    ArrayMultiplier uut(
        .A(A),
        .B(B),
        .P(P));
        
    initial begin
        A = 16'h050;
        B = 16'h050;
        
        #20
        A = 16'h1F30;
        B = 16'h1AA2;
        
        #20
        A = 16'h2A20;
        B = 16'h1D0A;
    end    
   
endmodule
