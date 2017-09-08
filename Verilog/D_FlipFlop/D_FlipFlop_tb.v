`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// D-Flip Flop Test Bench
// 
//	by: Patrick Stockton
//
//
//////////////////////////////////////////////////////////////////////////////////


module D_FlipFlop_tb(     );

    reg D, CLK, Reset;
    wire Q;

    D_FlipFlop UUT (.Q(Q), .D(D), .CLK(CLK), .Reset(Reset));
    
    always begin
        #10;
        CLK = ~CLK;
    end
    
    initial begin
        D = 1'b0;
        CLK = 1'b0;
        Reset = 1'b0;
    
        #100; 
        D = 1'b1;
        
        #50;
        Reset = 1'b1;
        
        #50;
        Reset = 1'b0;
        
        #50;
        D = 1'b0;
    
    end


endmodule
