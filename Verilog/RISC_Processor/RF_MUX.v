`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Register File Multiplexer module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


// The Register File Mux provides the traffic control for determining if
// the system will write the ALU output, write from the memory address, or
// write data
module RF_MUX (
		 input [15:0] data0,
		 input [15:0] data1, 
		 input [7:0] data2,
		 input [1:0] sel,
		 output reg [15:0] f);
		 
		 always@(data0 or data1 or data2 or sel)
		 begin
			case(sel)
				2'b00: begin // Write ALU output
							f <= data0;
						 end
				2'b01: begin // Write from memory address
							f <= data1;
						 end
				2'b10: begin // Write data
							f <= {8'b0000_0000, data2};
						 end
			endcase
		 end
endmodule	// end of RF_MUX