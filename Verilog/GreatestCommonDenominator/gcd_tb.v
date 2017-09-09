`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// GCD Calculator Test Bench
//
// by: Patrick Stockton
//
// 
//////////////////////////////////////////////////////////////////////////////////


module gcd_tb( );

    // Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg reset;
	reg clk;

	// Outputs
	wire [3:0] gcd_val;

	// Instantiate the Unit Under Test (UUT)
	gcd uut (.a(a), .b(b), .reset(reset), .clk(clk), .gcd_val(gcd_val));

    always
    begin
        #10;
        clk = ~clk;
    end
    
	initial begin
		// Initialize Inputs
		a = 4'b0000;
		b = 4'b0000;
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1'b1;
		
		#100;
		reset = 1'b0;
		
		#100;
		a= 4'b1000;   // 8
		b= 4'b0100;   // 4
		
		#100;
		a = 4'b0010; // 2
		b = 4'b0010; // 2
        
        #50;
        a = 4'b1110; // 14
        b = 4'b0100; // 4
        
        #100;
        a = 4'b1010; // 10
        b = 4'b1001; // 9

	end
      
endmodule