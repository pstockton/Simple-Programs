`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 4-to-16 Decoder
//
// by: Patrick Stockton
// 
//
//  
//////////////////////////////////////////////////////////////////////////////////

// The purpose of the 4-to-16 Decoder is to take a 4-bit input that acts as
// a select signal, and choose a 16-bit "decoded" value to be sent to the output port
module Decoder_4to16 (
	output [15:0] decoded,
	input [3:0] select);
	
	reg [15:0] decoded;
	wire [3:0] select;
	
	// When the select value changes, take a new sample
	// The chosen "decoded" values below were selected to easily identify the correct
	// changes on the output
	// Note: These outputs were personaly selected for a fluid waveform and are not fixed
	always @ (select) begin
		case (select)
			4'b0000 : decoded = 16'b0000_0000_0000_0001;
			4'b0001 : decoded = 16'b0000_0000_0000_0010;
			4'b0010 : decoded = 16'b0000_0000_0000_0100;
			4'b0011 : decoded = 16'b0000_0000_0000_1000;
			4'b0100 : decoded = 16'b0000_0000_0001_0000;
			4'b0101 : decoded = 16'b0000_0000_0010_0000;
			4'b0110 : decoded = 16'b0000_0000_0100_0000;
			4'b0111 : decoded = 16'b0000_0000_1000_0000;
			4'b1000 : decoded = 16'b0000_0001_0000_0000;
			4'b1001 : decoded = 16'b0000_0010_0000_0000;
			4'b1010 : decoded = 16'b0000_0100_0000_0000;
			4'b1011 : decoded = 16'b0000_1000_0000_0000;
			4'b1100 : decoded = 16'b0001_0000_0000_0000;
			4'b1101 : decoded = 16'b0010_0000_0000_0000;
			4'b1110 : decoded = 16'b0100_0000_0000_0000;
			4'b1111 : decoded = 16'b1000_0000_0000_0000;
			default : decoded = 16'b0000_0000_0000_0000;
		endcase
	end
	
endmodule