`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit Multiplier
//
// by: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////


module mult_16bit(
    output [31:0] product,
    input [15:0]a, b,
	input reset, clk);

	reg [15:0] x, y;
	reg [1:0] state, nstate;   // Current and next state
	reg [31:0] product;
	
	parameter Load = 1'b0;    // State for loading new input values
	parameter Calc = 1'b1;    // State for calculating multiplication to the two inputs
	
	// Always check for reset trigger, and update current state
	always @ (posedge clk)
		begin
			if(reset)
				begin
					x <= 16'd0;
					y <= 16'd0;
					state <= Load;
					nstate <= Load;
				end
			else // Performs state operations
			begin
				state <= nstate;
                      case(state)
                         Load: begin
                                 x <= a;
                                 y <= b;
                                 nstate <= Calc;
                                 $display ("Load case");
                          end
                          Calc: begin
                                 product <= x * y;
                                 nstate <= Load;
                                 $display ("Calc case");
                                 $display ("product = %d", product);
                          end
                                                
                      endcase
			 end
		end
		
	
endmodule  
