`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-Bit Subtractor Test Bench
//
// by: Patrick Stockton
//
// 
//////////////////////////////////////////////////////////////////////////////////

module subt_16bit_tb( );

    reg [15:0] a, b;
    reg cin;
    wire [15:0] difference;
    wire borrow;

    subt_16bit UTT (.difference(difference), .borrow(borrow), .a(a), .b(b), .cin(cin));

    initial
    begin
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;
        cin = 1'b0;
        
        #100;
        a = 16'b0000_0000_0000_1000;
        b = 16'b0000_0000_0000_0010;
        cin = 1'b0;
        
        #100;
        cin = 1'b1;
        
        #100;
        cin = 1'b0;
        a = 16'b0000_0000_0011_0000;
        b = 16'b0000_0000_0000_1111;
        
        #100;
        a = 16'h0002;
        b = 16'h0FFB;
                
        #100;
        a = 16'h0008;
        b = 16'h0004;     
    end

endmodule