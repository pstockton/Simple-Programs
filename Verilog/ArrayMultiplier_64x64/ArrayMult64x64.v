`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 64 x 64 Array Multiplier
//
//  by: Patrick Stockton
//          
//
// 
//////////////////////////////////////////////////////////////////////////////////

// 64x64 Array Multiplier
module ArrayMult64x64(Prod, A, B);
    output [127:0] Prod;
    input [63:0] A;
    input [63:0] B;
    
    wire [4:0] carry;
    wire [127:0] w1;
    wire [127:0] w2;
    wire [31:0] Sum0;
    wire [31:0] Sum1;
    // 127:96, 95:64, 63:32, 31:0
    Mult32b M320(w1[63:0], A[31:0], B[31:0]);
    Mult32b M321(w1[127:64], A[31:0], B[63:32]);
    Mult32b M322(w2[63:0], A[63:32], B[31:0]);
    Mult32b M323(w2[127:64], A[63:32], B[63:32]);
    
    FA32b F320(Sum0[31:0], carry[0], w1[63:32], w1[95:64], 1'b0);
    FA32b F321(Prod[63:32], carry[1], w2[31:0], Sum0[31:0], carry[0]);
    FA32b F322(Sum1[31:0], carry[2], w2[63:32], w1[127:96], carry[1]);
    FA32b F323(Prod[95:64], carry[3], w2[95:64], Sum1[31:0], carry[2]);
    FA32b F324(Prod[127:96], carry[4], w2[127:96], 32'd0, carry[3]);
    
    assign Prod[31:0] = w1[31:0];
        
endmodule


// 32-bit Multiplier
module Mult32b(Prod, A, B);
    output [63:0] Prod;
    input [31:0] A;
    input [31:0] B;
    
    wire [4:0] carry;
    wire [63:0] w1;
    wire [63:0] w2;
    wire [15:0] Sum0;
    wire [15:0] Sum1;
    
    Mult16b M160(w1[31:0], A[15:0], B[15:0]);
    Mult16b M161(w1[63:32], A[15:0], B[31:16]);
    Mult16b M162(w2[31:0], A[31:16], B[15:0]);
    Mult16b M163(w2[63:32], A[31:16], B[31:16]);
    
    FA16b F160(Sum0[15:0], carry[0], w1[31:16], w1[47:32], 1'b0);
    FA16b F161(Prod[31:16], carry[1], w2[15:0], Sum0[15:0], carry[0]);
    FA16b F162(Sum1[15:0], carry[2], w2[31:16], w1[63:48], carry[1]);
    FA16b F163(Prod[47:32], carry[3], w2[47:32], Sum1[15:0], carry[2]);
    FA16b F164(Prod[63:48], carry[4], w2[63:48], 16'd0, carry[3]);
    
    assign Prod[15:0] = w1[15:0];
        
endmodule


// 16-bit Multiplier
module Mult16b(Prod, A, B);
    output [31:0] Prod;
    input [15:0] A;
    input [15:0] B;
    
    wire [4:0] carry;
    wire [31:0] w1;
    wire [31:0] w2;
    wire [7:0] Sum0;
    wire [7:0] Sum1;
    
    Mult8b M80(w1[15:0], A[7:0], B[7:0]);
    Mult8b M81(w1[31:16], A[7:0], B[15:8]);
    Mult8b M82(w2[15:0], A[15:8], B[7:0]);
    Mult8b M83(w2[31:16], A[15:8], B[15:8]);
    
    FA8b F80(Sum0[7:0], carry[0], w1[15:8], w1[23:16], 1'b0);
    FA8b F81(Prod[15:8], carry[1], w2[7:0], Sum0[7:0], carry[0]);
    FA8b F82(Sum1[7:0], carry[2], w2[15:8], w1[31:24], carry[1]);
    FA8b F83(Prod[23:16], carry[3], w2[23:16], Sum1[7:0], carry[2]);
    FA8b F84(Prod[31:24], carry[4], w2[31:24], 8'd0, carry[3]);
    
    assign Prod[7:0] = w1[7:0];
    
endmodule


// 8-bit Multiplier
module Mult8b(Prod, A, B);
    output [15:0] Prod;
    input [7:0] A;
    input [7:0] B;
    
    wire [4:0] carry;
    wire [15:0] w1;
    wire [15:0] w2;
    wire [3:0] Sum0;
    wire [3:0] Sum1;
    
    Mult4b M40(w1[7:0], A[3:0], B[3:0]);
    Mult4b M41(w1[15:8], A[3:0], B[7:4]);
    Mult4b M42(w2[15:8], A[7:4], B[7:4]);
    Mult4b M43(w2[7:0], A[7:4], B[3:0]);
    
    FA4b F0(Sum0[3:0], carry[0], w1[7:4], w1[11:8], 1'b0);
    FA4b F1(Prod[7:4], carry[1], w2[3:0], Sum0[3:0], carry[0]);
    FA4b F2(Sum1[3:0], carry[2], w2[7:4], w1[15:12], carry[1]);
    FA4b F3(Prod[11:8], carry[3], w2[11:8], Sum1[3:0], carry[2]);
    FA4b F4(Prod[15:12], carry[4], w2[15:12], 4'd0, carry[3]);
    
    assign Prod[3:0] = w1[3:0];
    
endmodule


// 4-bit Multiplier
module Mult4b(Prod, A, B);
    output [7:0] Prod;
    input [3:0] A;
    input [3:0] B;
    
    wire [16:0] w;
    
    assign Prod[0] = (A[0]&B[0]);
    
    // Logic for multiplication
    HA HA0(Prod[1], w[0], (A[1]&B[0]), (A[0]&B[1]));
    FA FA0(w[1], w[2], (A[1]&B[1]), (A[0]&B[2]), w[0]);
    FA FA1(w[3], w[4], (A[1]&B[2]), (A[0]&B[3]), w[2]);
    HA HA1(w[5], w[6], (A[1]&B[3]), w[4]);
    HA HA2(Prod[2], w[14], w[1], (A[2]&B[0]));
    FA FA2(w[13], w[15], w[3], (A[2]&B[1]), w[14]);
    FA FA3(w[12], w[16], w[5], (A[2]&B[2]), w[15]);
    FA FA4(w[8], w[7], w[6], (A[2]&B[3]), w[16]);
    HA HA3(Prod[3], w[11], w[13], (A[3]&B[0]));
    FA FA5(Prod[4], w[10], w[12], (A[3]&B[1]), w[11]);
    FA FA6(Prod[5], w[9], w[8], (A[3]&B[2]), w[10]);
    FA FA7(Prod[6], Prod[7], w[7], (A[3]&B[3]), w[9]);
endmodule


// 32-bit Full Adder
module FA32b(Sum, Cout, A, B, Cin);
    output [31:0] Sum;
    output Cout;
    input [31:0] A;
    input [31:0] B;
    input Cin;
    
    wire carry;
    
    FA16b FA160(Sum[15:0], carry, A[15:0], B[15:0], Cin);
    FA16b FA161(Sum[31:16], Cout, A[31:16], B[31:16], carry);
    
endmodule


// 16-bit Full Adder
module FA16b(Sum, Cout, A, B, Cin);
    output [15:0] Sum;
    output Cout;
    input [15:0] A;
    input [15:0] B;
    input Cin;
    
    wire carry;
    
    FA8b FA80(Sum[7:0], carry, A[7:0], B[7:0], Cin);
    FA8b FA81(Sum[15:8], Cout, A[15:8], B[15:8], carry);
    
endmodule


// 8-bit Full Adder
module FA8b(Sum, Cout, A, B, Cin);
    output [7:0] Sum;
    output Cout;
    input [7:0] A;
    input [7:0] B;
    input Cin;
    
    wire carry;
    
    FA4b FA4b0(Sum[3:0], carry, A[3:0], B[3:0], Cin);
    FA4b FA4b1(Sum[7:4], Cout, A[7:4], B[7:4], carry);
    
endmodule

// 4-bit Full Adder
module FA4b(Sum, Cout, A, B, Cin);
    output [3:0] Sum;
    output Cout;
    input [3:0] A;
    input [3:0] B;
    input Cin;
    
    wire [2:0] carry;
    
    FA FA0(Sum[0], carry[0], A[0], B[0], Cin);
    FA FA1(Sum[1], carry[1], A[1], B[1], carry[0]);
    FA FA2(Sum[2], carry[2], A[2], B[2], carry[1]);
    FA FA3(Sum[3], Cout, A[3], B[3], carry[2]);
    
endmodule


// 1-bit Full Adder
module FA(Sum, Cout, A, B, Cin);
    output Sum, Cout;
    input A, B, Cin;
    
    assign Sum = (A^B^Cin); // Calculates the Sum of the 1-bit Full Adder
    assign Cout = ((A&B) | (A&Cin) | (B&Cin)); // Calculates the Carry Out of the 1-bit Full Adder
endmodule

// Half Adder
module HA(Sum, Cout, A, B);
    output Sum, Cout;
    input A, B;
    
    assign Sum = A^B; // Calculates the Sum of the Half Adder
    assign Cout = A&B; // Calculates the Carry Out of the Half Adder
    
endmodule

