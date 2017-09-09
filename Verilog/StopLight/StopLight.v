`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// StopLight System
//
//  By: Patrick Stockton
//      
//
//////////////////////////////////////////////////////////////////////////////////


module StopLight(
    input CLK, 
    output LeftGreen, Green, Amber, Red);
    
    //reg CLK;
    reg LeftGreen; //Green Turn Signal Light
	reg Green;     //Green Light
	reg Amber;     //Amber Light
	reg Red;       //Red Light
    reg [3:0] count;    //Counting steps
    
    //Initialize everything to start
    initial 
    begin
        count = 4'b1111;
    end 
    
    //Every positive edge of the clock, increment and determine state
    always @ (posedge CLK)
    begin
        count = count + 1'b1; //Increment
        if (count > 4'b1010) //If end-of-cycle is met
        begin
            count = 4'b0000;    //Reset counter
        end 
    end
    
    //Determine state of light output
    always @ (posedge CLK)
        begin
                case (count)
                    4'b0000 : begin     //Green Turn Signal Light (2 steps)
                                Red = 1'b0;
                                LeftGreen = 1'b1;
                              end
                    4'b0001 : LeftGreen = 1'b1;
                    4'b0010 : begin //Green Light (3 steps)
                                LeftGreen = 1'b0;
                                Green = 1'b1;
                              end
                    4'b0011 : Green = 1'b1;
                    4'b0100 : Green = 1'b1;
                    4'b0101 : begin     //Amber Light (1 step)
                                Green = 1'b0;
                                Amber = 1'b1;
                              end
                    4'b0110 : begin     //Red Light (5 steps)
								Amber = 1'b0;
                                Red = 1'b1;
							  end
                    4'b0111 : Red = 1'b1;
                    4'b1000 : Red = 1'b1;
                    4'b1001 : Red = 1'b1;
				    4'b1010 : Red = 1'b1;
                endcase  
        end

endmodule
