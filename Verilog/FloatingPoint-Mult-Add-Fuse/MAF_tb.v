`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 32-bit Floating Point Mult-Add-Fuse Test Bench
//
//  by: Patrick Stockton
//          
//
//  Note: Not fully complete
//////////////////////////////////////////////////////////////////////////////////


module MAF_tb( );

        reg [31:0] A;
        reg [31:0] B;
        reg [31:0] C;
        wire [63:0] result;
        
        // Mult-Add-Fuse Unit Under Test
        MAF UUT (.result(result), .A(A), .B(B), .C(C));
        
        initial
        begin
            // Initial setup and reset
            #100;
            A = 8'h00000000; // 0
            B = 8'h00000000; // 0
            C = 8'h00000000; // 0
        
            // (2 x 1) + 3 operation
            #20;
            A = 8'h00000002; // 2
            B = 8'h00000001; // 1
            C = 8'h00000003; // 3
            
            // (10 x 5) + 8 operation
            #20;
            A = 8'h0000000A; // 10
            B = 8'h00000005; // 5
            C = 8'h00000008; // 8
            
            //  (128 x 64) + 64 operation
            #20;
            A = 8'h00000080; // 128
            B = 8'h00000040; // 64
            C = 8'h00000040; // 64
            
            //  (-5 x 2) + 10 operation
            #20;
            //A = 8'h80000005; // -5
            A = 32'b10000000000000000000000000000101; // -5
            B = 8'h00000002; // 2
            C = 8'h0000000A; // 10
            
            // Multiplying -16 x -8
            #20;
            //A = 8'h80000010; // -16
            A = 32'b10000000000000000000000000010000; // -16
            //B = 8'h80000008; // -8
            B = 32'b10000000000000000000000000001000; // -8
        end
		
endmodule
