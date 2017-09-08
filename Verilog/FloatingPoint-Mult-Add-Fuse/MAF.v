`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 32-bit Floating Point Mult-Add-Fuse
//
//  by: Patrick Stockton
//         
//
//  Note: Not fully complete
//////////////////////////////////////////////////////////////////////////////////


module MAF(
    output [63:0] result,
    input [31:0] A, [31:0] B, [31:0] C);
    
    reg [63:0] result;
    
    reg sign;
    reg [7:0] exp;
    reg [54:0] mantissa;
    reg [63:0] product;
    
    always @*
    begin
        sign = A[31] ^ B[31]; // Calculating the sign by XOR'ing the MSB of each input
        //exp = A[30:23] + B[30:23] - 1023; // Calculating the exponent by adding the exp of each input and subtracting the 1023 bias
        exp = A[30:23] + B[30:23]; // Calculating the exponent by adding the exp of each input
        mantissa = A[22:0] * B[22:0]; // Calculating the mantissa by multiplying the inputs
        product[63] = sign;
        product[62:55] = exp;
        product[54:0] = mantissa;
        result[63:0] = product[63:0] + C[31:0];
    end
        
endmodule
