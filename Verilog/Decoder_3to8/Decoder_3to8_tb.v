`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 3-to-8 Decoder Test Bench
//
//
//  by: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoder3to8_tb( );
    reg [2:0]sel;
    wire [7:0]out;
    
    Decoder3to8 UUT (.out(out), .sel(sel));
    
    initial
    begin
        #100;
        sel = 3'b000; // case 0
        #50;
        sel = 3'b001; // case 1
        #50;
        sel = 3'b010; // case 2
        #50;
        sel = 3'b011; // case 3
        #50;
        sel = 3'b100; // case 4
        #50;
        sel = 3'b101; // case 5
        #50;
        sel = 3'b110; // case 6
        #50;
        sel = 3'b111; // case 7
    
    end
endmodule
