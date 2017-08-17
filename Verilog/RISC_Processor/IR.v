`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Instruction Register module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


// The Instruction Register loads each instruction into an array
// This will provide the current instruction if the IR Load is triggered
module IR (
		input clk, //rst, 
		input IR_ld,
		input [15:0] instruction,
		output reg [15:0] instruction_reg);    

		// For each clock cycle, check to see if IR load is active
		always @ (posedge clk)
		begin
			 //if (rst == 1) begin
			 //    instruction_reg <= 16'b0000_0000_0000_0000;
			// end else
			if (IR_ld == 1) 
			begin
				  instruction_reg <= instruction;
			end
		end
endmodule