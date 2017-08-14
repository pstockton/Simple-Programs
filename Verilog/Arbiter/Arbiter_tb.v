`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//  Arbiter - Test Bench
// 
// 
//  by: Stockton, Patrick
//  
// 
//////////////////////////////////////////////////////////////////////////////////

module Arbiter_tb( );

	reg [2:0] request;
	reg reset;
	reg clk;
	wire [2:0] grant;

    // Generate clock signal with a 10ns period
   always 
   begin
       #10
       clk = ~clk;
   end
	 
	// Instantiate the Unit Under Test (UUT)
	Arbiter uut (.grant(grant),.request(request),.reset(reset),.clk(clk));

	initial
	begin

		request = 0;
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        request = 3'b000; // Case 0
            
        #20;
        request = 3'b001; // Case 1
            
        #20;
        request = 3'b010; // Case 2
            
        #20;
        request = 3'b011; // Case 3
            
        #20;
        request = 3'b100; // Case 4
            
        #20;
        request = 3'b101; // Case 5
            
        #20;
        request = 3'b110; // Case 6
            
        #20;
        request = 3'b111; // Case 7
            
        #20;
        reset = 1'b1; // test reset case
		
		#20;
		reset = 1'b0;
	end
      
endmodule
