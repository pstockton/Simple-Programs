`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Arbiter
//
// 
// by: Stockton, Patrick
// 
// The Arbiter grants (outputs) the certain request (input/sel)
//////////////////////////////////////////////////////////////////////////////////
module Arbiter(
	output [2:0] grant, 
    input [2:0] request, 
    input reset, clk);
    
    // Declare registers & wires
    reg [2:0] grant;
    wire [2:0] request;
    
    always @ (clk)
    begin
        // If reset is active, set grant to equal 0
        if (reset == 1)
        begin
            grant = 3'b000;
        end
        
        // If reset is not active, perform cases
        else if (reset == 0)
        begin
            
            case (request)
                    // Truth table values
                    0 : grant = 3'b100;
                    1 : grant = 3'b001;
                    2 : grant = 3'b010;
                    3 : grant = 3'b001;
                    4 : grant = 3'b100;
                    5 : grant = 3'b100;
                    6 : grant = 3'b010;
                    7 : grant = 3'b010;
                    default : grant = 3'b000;
            endcase
        end
    end
             
endmodule