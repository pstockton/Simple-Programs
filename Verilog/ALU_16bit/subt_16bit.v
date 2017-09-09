`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit Subtractor
//
// by: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////


module subt_16bit (
	output [15:0] difference,
	output borrow,
	input [15:0] a, b,
	input cin);
	
	wire w;
	
	subt_8bit s8b0 (difference[7:0], w, a[7:0], b[7:0], cin);
	subt_8bit s8b1 (difference[15:8], borrow, a[15:8], b[15:8], w);
	
endmodule


module subt_8bit (
	output [7:0] difference,
	output borrow,
	input [7:0] a, b,
	input cin);
	
	wire w;
	
	subt_4bit s4b0 (difference[3:0], w, a[3:0], b[3:0], cin);
	subt_4bit s4b1 (difference[7:4], borrow, a[7:4], b[7:4], w);
	
endmodule


module subt_4bit (
	output [3:0] difference,
	output borrow,
	input [3:0] a, b,
	input cin);
	
	wire [2:0] w;
	
	subt_1bit s1b0 (difference[0], w[0], a[0], b[0], cin);
	subt_1bit s1b1 (difference[1], w[1], a[1], b[1], w[0]);
	subt_1bit s1b2 (difference[2], w[2], a[2], b[2], w[1]);
	subt_1bit s1b3 (difference[3], borrow, a[3], b[3], w[2]);
	
endmodule


module subt_1bit (
	output difference, borrow,
	input a, b, cin);
	
	assign difference = a ^ b ^ cin;
	assign borrow = ((~a)&b) | ((~a)&cin) | (b&cin);
	
endmodule
