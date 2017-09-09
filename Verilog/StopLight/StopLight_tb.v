`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// StopLight System Test Bench
//
//  By: Patrick Stockton
//      
//
//////////////////////////////////////////////////////////////////////////////////

//Test bench for the Stoplight system
module StopLight_tb( );
    
    reg CLK;
    wire LeftGreen;
    wire Green;
    wire Amber;
    wire Red;
    
    StopLight UUT (.CLK(CLK), .LeftGreen(LeftGreen), .Green(Green), .Amber(Amber), .Red(Red));
    
    initial
    begin
    
    #100;

    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;

    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;
    
    #10;
    CLK = 1;
    
    #10;
    CLK = 0;

    
    end
endmodule
