`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 8-bit Ripple Carry Adder
//
// by: Patrick Stockton
// 
//
//  
//////////////////////////////////////////////////////////////////////////////////

// 8-bit Ripple Carry Adder
module RCA8bit(
	output [7:0]Sum,
	output Cout, 
	input [7:0] A, [7:0] B, 
	input Cin);
	
    wire w;
    
    // Instantiated instances of 4-bit RCAs to create 8-bit RCA
    RCA4bit RCA4a (Sum[3:0], w, A[3:0], B[3:0], Cin);
    RCA4bit RCA4b (Sum[7:4], Cout, A[7:4], B[7:4], w);

endmodule

// 4-bit Ripple Carry Adder
module RCA4bit(
	output [3:0]Sum,
	output Cout, 
	input [3:0] A, [3:0] B, 
	input Cin);
	
    wire w1, w2, w3;
    
    // Instantiated instances of FullAdders to create 4-bit RCA
    full_adder FA0 (Sum[0], w1, A[0], B[0], Cin);
    full_adder FA1 (Sum[1], w2, A[1], B[1], w1);
    full_adder FA2 (Sum[2], w3, A[2], B[2], w2);
    full_adder FA3 (Sum[3], Cout, A[3], B[3], w3);

endmodule

// 1-bit Full Adder using two half-adders
module full_adder (
	output Sum, Cout,
	input A, B, Cin);
    
    // Instantiated instances of HalfAdders to create 1-bit FullAdder
    HalfAdder HA0 (w1, w2, A, B);
    HalfAdder HA1 (Sum, w3, w1, Cin);
    or gate0 (Cout, w2, w3);

endmodule

// Half-Adder
module HalfAdder(
	output Sum, Cout,
	input A, B);
    
    xor (Sum, A, B);
    and (Cout, A, B);

endmodule
