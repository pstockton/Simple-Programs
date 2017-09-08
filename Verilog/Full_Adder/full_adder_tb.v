`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 1-bit Full Adder Test Bench
//
// by: Patrick Stockton
// 
//
//  
//////////////////////////////////////////////////////////////////////////////////

module full_adder_tb(  );

    reg A, B, Cin;
    wire Sum, Cout;
    
    full_adder UUT (.Sum(Sum), .Cout(Cout), .A(A), .B(B), .Cin(Cin));
	
    initial begin
        A = 1'b0;
        B = 1'b0;
        Cin = 1'b0;
        
        #100;
        A = 1'b1;
        
        #50;
        B = 1'b1;
        
        #50;
        Cin = 1'b1;
        
        #50;
        A = 1'b0;
        B = 1'b0;
        
        #50;
        A = 1'b1;
        Cin = 1'b0;
           
    end

endmodule
