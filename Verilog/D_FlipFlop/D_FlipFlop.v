`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// D Flip-Flop
//
// by: Patrick Stockton
// 
//
//  
//////////////////////////////////////////////////////////////////////////////////

module D_FlipFlop (
	output Q,
	input D, CLK, Reset);
	
	reg Q;
	wire D, CLK, Reset;
	
	// Always take a sample at the posedge edge of the clip
	// This provides the "edge triggered" characteristic of
	// the Flip Flop
	always @ (posedge CLK) begin
		if (Reset) begin	// If reset is active, set the output to zero
			Q = 1'b0;
		end
		else begin	// Else if reset is inactive, trigger the correct output
			Q = D;
		end
	end
	
	
endmodule