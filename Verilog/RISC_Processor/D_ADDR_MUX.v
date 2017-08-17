`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Data Address Multiplexer module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


// The Data Address Mux provides the traffic control for whether to load
// the new instruction from the PC address, or from the memory address	 
module D_ADDR_MUX (
		 input [7:0] data0,
		 input [7:0] data1,
		 input sel,
		 output reg [7:0] f);

		 // Trigger on either data inputs or the select signal for the next
		 // address input
		 always @ (data0 or data1 or sel)
		 begin
			case(sel)
				2'b0: begin //Program Counter Address
							f <= data0;
						 end
				2'b1: begin //Memory Address
							f <= data1;
						 end
			endcase
		 end
endmodule	// end of D_ADDR_MUX