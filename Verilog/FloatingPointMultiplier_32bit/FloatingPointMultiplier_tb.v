`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 32-bit Floating Point Multiplier Test Bench
//
//  by: Patrick Stockton
//          
//
// 
//////////////////////////////////////////////////////////////////////////////////


module FloatingPointMultiplier_tb( );

    reg [31:0] A;
    reg [31:0] B;
    wire [63:0] product;
    
    // Floating Point Multiplier Unit Under Test
    FloatingPointMultiplier UUT (.product(product), .A(A), .B(B));
     
    initial
    begin
        // Initial setup and reset
        #100;
        A = 8'h00000000; // 0
        B = 8'h00000000; // 0
    
        // Multiplying 2 x 1
        #20;
        A = 8'h00000002; // 2
        B = 8'h00000001; // 1
        
        // Multiplying 128 x 64
        #20;
        A = 8'h00000080; // 128
        B = 8'h00000040; // 64
        
        // Multiplying -5 x 2
        #20;
        //A = 8'h80000005; // -5
        A = 32'b10000000000000000000000000000101; // -5
        B = 8'h00000002; // 2
        
        // Multiplying -16 x -8
        #20;
        //A = 8'h80000010; // -16
        A = 32'b10000000000000000000000000010000; // -16
        //B = 8'h80000008; // -8
        B = 32'b10000000000000000000000000001000; // -8
    end
	
endmodule
