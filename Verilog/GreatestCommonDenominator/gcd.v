`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// GCD Calculator
//
// by: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////

// This module will calculate the GCD between two integers
module gcd(
    input [3:0]a, b,
	input reset, clk,
    output [3:0] gcd_val);

	reg [3:0] x, y;
	reg [1:0] state, nstate;   // Current and next state
	reg [3:0] gcd_val;
	
	parameter Load = 2'b00;    // State for loading new input values
	parameter Calc = 2'b01;    // State for calculating GCD to the two inputs
	parameter Complete = 2'b10;    // State for determining when GCD is found
	
	// Always check for reset trigger, and update current state
	always@(posedge clk)
		begin
			if(reset)
				begin
					x <= 4'b0000;
					y <= 4'b0000;
					state <= Load;
					nstate <= Load;
				end
			/*if(reset) 
				begin
					state  <= Load;
					nstate <= Load;
				end*/
			else // Performs state operations
			begin
				state <= nstate;
				$display ("");
                            case(state)
                                Load:begin
                                        x <= a;
                                        y <= b;
                                        nstate <= Calc;
                                        end
                                Calc: begin
                                //while (nstate == Calc)
                                        //begin
                                            if (x == 0)
                                                begin    
                                                    gcd_val <= y;
                                                    nstate <= Complete;
                                                    $display ("x == 0!!, completed");
                                                    $display ("gcd_val = %d", gcd_val);
                                                end
                                                
                                            else if (y == 0)
                                                begin
                                                    gcd_val <= x;
                                                    nstate <= Complete;
                                                    $display ("y == 0!!, completed");
                                                    $display ("gcd_val = %d", gcd_val);
                                                end
                                                
                                            else if (x >= y)
                                                begin
                                                    x = x - y;
                                                    nstate <= Calc;
                                                    $display ("x > y");
                                                    $display ("x - y = %d", x);
                                                end
                                                
                                            else if (y >= x)
                                                begin
                                                    y = y - x;
                                                    nstate <= Calc;
                                                    $display ("y > x");
                                                    $display ("y - x = %d", y);
                                                end
                                        end
                                        //end
                                                
                                Complete: begin
                                            nstate <= Load;
                                        end
                            endcase
                            $display ("Current state (qn) = %b", nstate);
                            $display ("State (state) = %b", state);
			end
		end
		
endmodule
