`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 3-to-8 Decoder
//
//
//  by: Patrick Stockton
//     
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoder_3to8 (
	output [7:0]out, 
	input [2:0]sel);
	
    reg [7:0]out;
    
    always @ (sel)
    begin
        case (sel)
            3'b000 : out = 8'b10000000; // case 0
            3'b001 : out = 8'b01000000; // case 1 
            3'b010 : out = 8'b00100000; // case 2
            3'b011 : out = 8'b00010000; // case 3
            3'b100 : out = 8'b00001000; // case 4
            3'b101 : out = 8'b00000100; // case 5
            3'b110 : out = 8'b00000010; // case 6
            3'b111 : out = 8'b00000001; // case 7
        endcase
    end

endmodule
