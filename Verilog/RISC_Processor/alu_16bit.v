`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit Algorithmic Unit module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


module alu_16bit(
	input signed [15:0]rf_out_1,
	input signed [15:0]rf_out_2,
	input [2:0]alu_sel,
	output reg [15:0]alu_res);

		 //reg [15:0]alu_res;
		
	always @(rf_out_1, rf_out_2, alu_sel)
	begin
		//alu_res = 16'h0000;
			
		case(alu_sel)
			3'b000 : alu_res <= rf_out_1 + rf_out_2; //add inputs
			3'b001 : alu_res <= rf_out_1 - rf_out_2; //sub inputs
			3'b010 : alu_res <= rf_out_1 & rf_out_2; //AND inputs
			3'b011 : alu_res <= rf_out_1 | rf_out_2; //OR inputs
			3'b100 : alu_res <= rf_out_1 ^ rf_out_2; //XOR inputs
			3'b101 : alu_res <= ~rf_out_1; 	  //NOT input 1
			3'b110 : alu_res <= rf_out_1 << 1;	  //Shift Left input 1
			3'b111 : alu_res <= rf_out_1 >> 1;	  //Shift right input 1
		endcase
	end
 endmodule