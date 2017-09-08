`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 4-bit Ripple Carry Adder Test Bench
// 
//	by: Patrick Stockton
//
//
//
//////////////////////////////////////////////////////////////////////////////////

module RCA4bit_tb(  );

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    
    RCA4bit UUT (.Sum(Sum), .Cout(Cout), .A(A), .B(B), .Cin(Cin));
    
    initial begin
        A = 4'b0000;
        B = 4'b0000;
        Cin = 1'b0;
        
        #100;
        A = 4'b0001;
        B = 4'b0010;
        
        #50;
        A = 4'b1000;
        
        #50;
        Cin = 1'b1;
        
        #50;
        B = 4'b0000;    
    
    end
endmodule
