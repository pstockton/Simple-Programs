`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 8-bit Carry Look Ahead Adder
//
//  By: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////

// The 8-bit CLA using 2 instantiations of the 4-bit CLA
module CLA8bit(
    input [7:0] A, B,
    input Cin,
    output [7:0] S,
    output Cout, GG, PG);
        
    wire C_out;
    wire [1:0] Pgi, Ggi;
    
    CLA4bit CLA0 (A[3:0], B[3:0], Cin, S[3:0], C_out, Ggi[0], Pgi[0]);
    CLA4bit CLA1 (A[7:4], B[7:4], C_out, S[7:4], Cout, Ggi[1], Pgi[1]);
    
    assign PG = Pgi[1] & Pgi[0];    // Propagate
    assign GG = Ggi[1] | Pgi[1] & Ggi[0];   // Generate
           
endmodule
    

// Function for the 4-bit CLA
module CLA4bit(input [3:0] A, B, input Cin,
    output [3:0] S, output Cout, GG, PG);
    
    wire [3:0] G, P, S, C;

    // Instantiating the adder to create each CLA bit
    partialFullAdder pFA0 (A[0], B[0], Cin, G[0], S[0], P[0]);
    partialFullAdder pFA1 (A[1], B[1], C[0], G[1], S[1], P[1]);
    partialFullAdder pFA2 (A[2], B[2], C[1], G[2], S[2], P[2]);
    partialFullAdder pFA3 (A[3], B[3], C[2], G[3], S[3], P[3]);

    // If there is a remainder from the carry, set Cout
    assign Cout = C[3];

    // The CLA Logic function call
    Logic L0 (G[3:0],P[3:0],Cin,Cout,Pg,Gg,C[3:0]);
    assign GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign PG = P[3] & P[2] & P[1] & P[0];


endmodule


// Full Adder function
module partialFullAdder(input A, B, Cin,
    output G, S, P);
           
    wire G, S, P;
                
    assign G = A & B;   // Generate
    assign P = A ^ B;   // Propagate
    assign S = A ^ B ^ Cin; // Sum
                
        
endmodule
    
    
    
// Function for the logic of the carry (generate/propagate)
module Logic(
    input [3:0] G, P, input Cin,
    output Cout, PG, GG, output [3:0]C);
    
    wire [3:0] C;
    
    assign C[0]= G[0] | P[0] & Cin;  
    assign C[1]= G[1] | P[1] & G[0] | P[1] & P[0] & Cin;
    assign C[2]= (G[2] | P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
    assign C[3]= G[3] | P[3] & G[2] | P[3] & P[2] & G[1] | P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & Cin;
    
endmodule
