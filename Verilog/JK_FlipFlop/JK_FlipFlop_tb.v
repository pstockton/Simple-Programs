`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  JK Flip Flop Test Bench
//
//  By: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////

// Instantiate the JK Flip Flop Test Bench
module JKFF_tb(J, K, CLK, ClrN, SetN, Q, QN);
    reg J, K, CLK;
    wire Q, QN;
    
    // Unit Under Test
    JK_FlipFlop UUT(.J(J), .K(K), .CLK(CLK), .ClrN(ClrN), .SetN(SetN), .Q(Q), .QN(QN));
    
    always 
    begin
        #5 CLK = ~CLK;
    end 
    
    initial
    begin
			
		// Reset all inputs
		#10;
		J = 1'b0;
		K = 1'b0;
		CLK = 0;
		ClrN = 1'b0;
		SetN = 1'b0;
		
		// Promote Set to 1 to begin
		#30;
		J = 1'b0;
		K = 1'b0;
		SetN = 1'b1;
		ClrN = 1'b0;
		
		// Set Clear (Asynchronous), test first input of truth table ( 00 )
		#60;
		J = 1'b0;
		K = 1'b0;
		SetN = 1'b0;
		ClrN = 1'b1;
		
		// Test second input of truth table ( 01 )
		#90;
		J = 1'b1;
		K = 1'b0;
		SetN = 1'b1;
		ClrN = 1'b1;
		
		// Test third input of truth table ( 10 )
		#120;
		J = 1'b0;
		K = 1'b1;
		
		// Test final input of truth table ( 11 )
		#150;
		J = 1'b1;
		K = 1'b1;
	end

endmodule
