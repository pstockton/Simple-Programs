`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit Arithmetic Logic Unit Test Bench
//
//	by: Patrick Stockton
//
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_16bit_tb( );
    
    reg [15:0] a, b;
    reg [1:0] sel;
    reg reset, clk;
    wire [31:0] out;
    wire [1:0] selected_op;
    
    ALU_16bit UUT (.out(out), .selected_op(selected_op), .a(a), .b(b), .sel(sel), .reset(reset), .clk(clk));
    
    always
    begin
        #10;
        clk = ~clk;
    end
    
    initial
    begin
        reset = 1'b0;
        clk = 1'b0;
        sel = 2'b00;
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;
        
        #50;
        reset = 1'b1;
        
        // Addition: 12 + 2
        #100;
        reset = 1'b0; // Addition
        sel = 2'b00;
        a = 16'b0000_0000_0000_1100;    // 12
        b = 16'b0000_0000_0000_0010;    // 2
        
        #50;
        sel = 2'b01;    // Subtraction
        #50;
        sel = 2'b10;    // Multiplication
        #50;
        sel = 2'b11;    // Shift Right
        
        // Subtraction: 32 - 16
        #100;
        sel = 2'b01;
        a = 16'b0000_0000_0010_0000;    // 32
        b = 16'b0000_0000_0001_0000;    // 16
        
        // Product: 8 * 8
        #100;
        sel = 2'b10;
        a = 16'b0000_0000_0000_1000;    // 8
        b = 16'b0000_0000_0000_1000;    // 8
        
        // Shift Right:
        #100;
        sel = 2'b11;
        a = 16'b0000_0100_0111_1000;
        
        #100;
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;       
    end
      
endmodule
