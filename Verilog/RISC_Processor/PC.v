`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Program Counter module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


// Program Counter
// Tracks current instruction execution location of the system
module PC (
     input clk,
     input PC_clr, PC_inc, //PC_ld
     output reg [7:0] PC_addr);	

		// Set initial PC address to LOC zero
		initial begin
			PC_addr = 8'b0000_0000;
		end

		// For every cycle of the clock, increment the PC
		// If PC Clear is triggered, reset PC address to zero
		always @ (posedge clk)
		begin
			 if (PC_clr == 1) 
			 begin
				  PC_addr <= 8'b0000_0000;
			 end else if (PC_inc == 1 ) 
			 begin
				  PC_addr <= PC_addr + 8'b0000_0001; 
			 end
		end
endmodule // end of PC
