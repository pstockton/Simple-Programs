`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 1-bit Full Adder
//
// by: Patrick Stockton
// 
//
//  
//////////////////////////////////////////////////////////////////////////////////

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
