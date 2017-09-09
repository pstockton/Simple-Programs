`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Shift Right
//
// by: Patrick Stockton
//
//
//////////////////////////////////////////////////////////////////////////////////


module ShiftRight(
    output [31:0] out,
    input [15:0] in,
    input sel, clear);
    
    reg [31:0] out;
    reg [15:0] temp, pad; // temp stores the new input value after it's shifted. Pad pads the left 16bits with 0s
    wire [15:0] in;
    
    // Initialize temp and pad to be 16'bits of 0's
    initial
    begin
        temp = 16'b0000_0000_0000_0000;
        pad = 16'b0000_0000_0000_0000;
    end
    
    always @ (*)
    begin
        if (clear)
        begin
            temp = pad; // reset temp to zero
        end
        else if (sel)
        begin
            temp = in >> 1; // Shift the "in" value to the right by 1 bit
            out = {pad, temp};
        end
    end
    
endmodule
