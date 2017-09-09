`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit Arithmetic Logic Unit
//
// by: Patrick Stockton
//      
//
//  Provides functions such as:
//      Addition, Subtraction, Multiplication, and Shift Right
//////////////////////////////////////////////////////////////////////////////////


module ALU_16bit(
    output [31:0] out,
    output [1:0] selected_op,
    input [15:0] a, b,
    input [1:0] sel,
    input reset, clk);
    
    reg [31:0] out;
    reg [1:0] selected_op;  // Used to output select signals to LEDs on FPGA
    wire borrow, cout;  // Storing carry outs and borrows for future use
    wire [15:0] a, b;
    wire [1:0] sel;
    wire reset, clk;
    wire [31:0] product, addition, subtraction, shift;  // Used as outputs for each arithmetic module
    
    RCA16bit Add0 (addition, cout, a, b, 1'b0);  // Addition module; output, output, input, input, cin = 0
    subt_16bit Sub0 (subtraction, borrow, a, b, 1'b0); // Subtraction module; output, output, input, input, cin = 0
    mult_16bit Mult0 (product, a, b); // Multiplication module; output, input, input, reset, clock
    ShiftRight SR0 (shift, a, sel[1], 1'b0); // Shift Right module; output, input, select, clear
    
    always @ (a or b or sel or reset)
    begin
        if (reset)
        begin
            out = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        end
        else
        begin
            selected_op = sel; // To provide output to the Spartan6 LEDs
            case (sel)
                2'b00 : out = addition;
                2'b01 : out = subtraction;
                2'b10 : out = product;
                2'b11 : out = shift;
                default : out = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
            endcase
        end
    end
    
endmodule
