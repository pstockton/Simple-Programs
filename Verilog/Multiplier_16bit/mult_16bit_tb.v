`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit Multiplier Test Bench
//
// by: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////


module mult_16bit_tb( );

    reg [15:0] a, b;
    reg reset, clk;
    wire [31:0] product;
    
    mult UUT (.product(product), .a(a), .b(b), .reset(reset), .clk(clk));
    
    always
    begin
        #2;
        clk = ~clk;
    end
    
    initial
    begin
        reset = 1'b0;
        clk = 1'b0;
        a = 16'h0000;
        b = 16'h0000;
        
        
        #10;
        reset = 1'b1;
        
        #10;
        reset = 1'b0;
        
        #100;
        a = 16'd524;
        b = 16'd5;
		  
		  #100;
        a = 16'd7;
        b = 16'd2620;
		  
		  #100;
        a = 16'd18340;
        b = 16'd3;
		  
		  #100;
        a = 16'd60_340;
        b = 16'd104;
		  
		  #100;
        a = 16'd60_340;
        b = 16'd60_340;
		  
		  #100;
        a = 16'hFFFF;
        b = 16'h0002;
		  
		  #200;
		a = 16'd0;
		b = 16'd0;
	  
    end
    
endmodule 
