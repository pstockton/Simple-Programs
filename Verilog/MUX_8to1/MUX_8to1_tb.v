`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 8-to-1 Multiplexer Test Bench
//
//
// by: Patrick Stockton
//     
// 
//////////////////////////////////////////////////////////////////////////////////

module MUX8to1_tb( );
    reg [7:0]in;
    reg [2:0]sel;
    wire out;
    
    MUX8to1 UUT (.out(out), .in(in), .sel(sel));
    
    initial
    begin
        #100;
        sel = 3'b000; // reset sel
        in = 8'b00000000; // reset input
        
        #50;
        in = 8'b00001001;
        sel = 3'b010; // select in[2]
        
        #50;
        sel = 3'b011; // select in[3]
        
        #50;
        sel = 3'b110; // select in[6]
        
        #50;
        sel = 3'b111; // select in[7]
        
        #50;
        sel = 3'b001; // select in[1]
        
        #50;
        sel = 3'b010; // select in[2]
        
    end
    
endmodule
