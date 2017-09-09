`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Coin Machine
//
// By: Patrick Stockton
//      
// 
//////////////////////////////////////////////////////////////////////////////////

module CoinMachine_tb( );

    reg nickel, dime, quarter;
    wire dispenseNoBalance, dispenseBalance;
    wire [7:0] count;

    CoinMachine UUT (.nickel(nickel), .dime(dime), .quarter(quarter), .dispenseNoBalance(dispenseNoBalance), .dispenseBalance(dispenseBalance), .count(count));
    
    initial
    begin
    
    #100;
    
    nickel = 1'b1;
    
    #50;
    nickel = 1'b0;
    dime = 1'b1;
    
    #50;
    dime = 1'b0;
    quarter = 1'b1;
    
    #50;
    quarter = 1'b0;
    dime = 1'b1;
    
    #50;
    dime = 1'b0;
    quarter = 1'b1;
    
    #50;
    quarter = 1'b0;
    dime = 1'b1;
    
    #50;
    dime = 1'b0;
    quarter = 1'b1;
    
    #50;
    quarter = 1'b0;
    dime = 1'b1;
    
    #50;
    dime = 1'b0;
    
    #50;
    dime = 1'b1;
    
    #50;
    dime = 1'b0;
    
    end
      
endmodule


