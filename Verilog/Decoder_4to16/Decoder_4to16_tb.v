`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 4-to-16 Decoder Test Bench
// 
//	by: Patrick Stockton
//
//
//////////////////////////////////////////////////////////////////////////////////

module Decoder_4to16_tb( );

    reg [3:0] select;
    wire [15:0] decoded;
    
    Decoder_4to16 UUT (.decoded(decoded), .select(select));
    
    initial begin
        select = 4'b0000;
        
        #100;
        select = 4'b0001;
        
        #20;
        select = 4'b0010;
        
        #20;
        select = 4'b0011;
        
        #20;
        select = 4'b0100;
        
        #20;
        select = 4'b1011;
        
        #20;
        select = 4'b1111;
        
        #20;
        select = 4'b0000;
    
    end

endmodule
