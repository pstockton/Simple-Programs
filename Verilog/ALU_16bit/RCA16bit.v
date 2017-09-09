`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit Ripple Carry Adder
//
// by: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////


module RCA16bit (
	output [15:0] sum,
	output cout,
	input [15:0] a, b,
	input cin);
	
	wire w;
	
	RCA8bit RCA8b0 (sum[7:0], w, a[7:0], b[7:0], cin);
	RCA8bit RCA8b1 (sum[15:8], cout, a[15:8], b[15:8], w);	
	
endmodule


module RCA8bit (
	output [7:0] sum,
	output cout,
	input [7:0] a, b,
	input cin);
	
	wire w;
	
	RCA4bit RCA4b0 (sum[3:0], w, a[3:0], b[3:0], cin);
	RCA4bit RCA4b1 (sum[7:4], cout, a[7:4], b[7:4], w);	
	
endmodule


module RCA4bit (
	output [3:0] sum,
	output cout,
	input [3:0] a, b,
	input cin);
	
	wire [2:0] w;
	
	full_adder FA0 (sum[0], w[0], a[0], b[0], cin);
	full_adder FA1 (sum[1], w[1], a[1], b[1], w[0]);
	full_adder FA2 (sum[2], w[2], a[2], b[2], w[1]);
	full_adder FA3 (sum[3], cout, a[3], b[3], w[2]);
	
endmodule


module full_adder (
	output sum, cout,
	input a, b, cin);
	
	wire [2:0] w;
	
	assign cout = (a&&b) || (a&&cin) || (b&&cin);
    assign sum = a ^ b ^ cin;
	
endmodule


module half_adder (
	output sum, cout,
	input a, b);
	
	xor (sum, a, b);
	and (cout, a, b);
	
endmodule