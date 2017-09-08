`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 8-bit Ripple Carry Adder Test Bench
// 
//	by: Patrick Stockton
//
//
//
//////////////////////////////////////////////////////////////////////////////////

module RCA8bit_tb(  );

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    wire [7:0] Sum;
    wire Cout;
    
    RCA8bit UUT (.Sum(Sum), .Cout(Cout), .A(A), .B(B), .Cin(Cin));
    
    initial begin
        A = 8'b0000_0000;
        B = 8'b0000_0000;
        Cin = 1'b0;
        
        #100;
        A = 8'b0000_0001;
        B = 8'b0000_0010;
        
        #50;
        A = 8'b0000_1000;
        
        #50;
        Cin = 1'b1;
        
        #50;
        A = 8'b0010_1111;
        B = 8'b1000_0001;
        
        #50;
        B = 8'b0000_0000;
        
    end
	
endmodule
