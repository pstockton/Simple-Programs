`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Coin Machine
//
// By: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////


module CoinMachine(
	input nickel, dime, quarter,
    output dispenseNoBalance, dispenseBalance,
    output [7:0] count);

    reg [7:0] count;    //Track the total value inputted
    reg dispenseNoBalance, dispenseBalance; //Balance dispense
    wire nickel, dime, quarter;     //Inputs to increment the count by
    
    //Set all values to zero when initializing
    initial
    begin
        count = 8'b00000000;
        dispenseNoBalance = 1'b0;
        dispenseBalance = 1'b0;
    end
    
    //If an input is triggered, perform this loop
    always @ (nickel or dime or quarter)
    begin
        if (count >= 8'b00111100)   //If the value of the total count is greater than 60
        begin
            count = count - 8'b00111100;    //Subtract 60 from the total count
                if (count == 1'b0)  //Determine if there is a remainding balance
                begin
                    dispenseNoBalance = 1'b1;   //No remaining balance after dispense
               end
                else if (count > 1'b0)
                begin
                    dispenseBalance = 1'b1; //Remaining balance after dispense
               end
        end
        else if (count < 8'b00111100)   //If total count is less than 60, allow more increments
        begin
            if (nickel == 1'b1)
            begin
                count = count + 8'b00000101;    //5
            end
            if (dime == 1'b1)
            begin
                count = count + 8'b00001010;    //10
            end
            if (quarter == 1'b1)
            begin
                count = count + 8'b00011001;    //25
            end
        end
    end  
endmodule
