`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  JK Flip Flop
//
//  By: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////

// Instantiate the JK module
module JKFF(J, K, CLK, ClrN, SetN, Q, QN);
    input [1:0]J;
    input [1:0]K;
    input CLK, ClrN, SetN;
    output Q, QN;
    
    reg Q, QN;
    
    always @ (posedge CLK)
    begin
    if (ClrN)
    begin
    // Set values for Q and QN for clear
        Q <= 0;
        QN <= 1;
    end
    else begin
    if (J==1 && K==0)
        QN <= 1;    // Set
    
    else if (J==0 && K==1)
        QN <= 0;    // Reset
        
    else if (J==1 && K==1)
        QN <= ~QN;  // Toggle
    else
        Q <= QN;
        QN <= ~Q;
    end    
    //assign QN = ~Q; 

endmodule

// Instantiate the 4-Bit JK Flip Flop
module JKFF_4B (J, K, CLK, ClrN, SetN, Q, QN);
    input [3:0]J;
    input [3:0]K;
    input CLK, ClrN, SetN;
    output [3:0] QN;
    inout [3:0] Q;
    
    JKFF JK0(J[0], K[0], CLK, ClrN, SetN, Q[0], QN[0]);
    JKFF JK1(J[0], K[1], CLK, ClrN, SetN, Q[1], QN[1]);
    JKFF JK2(J[1], K[2], CLK, ClrN, SetN, Q[2], QN[2]);
    JKFF JK3(J[2], K[3], CLK, ClrN, SetN, Q[3], QN[3]);
    
endmodule
    