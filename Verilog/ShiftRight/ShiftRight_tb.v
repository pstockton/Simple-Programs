`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Shift Right Test Bench
//
//	by: Patrick Stockton
//
// 
//////////////////////////////////////////////////////////////////////////////////


module ShiftRight_tb( );
    
    reg [15:0] in;
    reg sel, clear;
    wire [31:0] out;
    
    ShiftRight UUT (.out(out), .in(in), .sel(sel), .clear(clear));
    
    initial
    begin
        sel = 1'b0;
        clear = 1'b0;
        in = 16'b0000_0000_0000_0000;
        
        #100;
        sel = 1'b1;
        in = 16'b0000_0000_1000_1100;
        
        #100;
        sel = 1'b0;
        
    end
    
endmodule
