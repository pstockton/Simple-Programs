`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Instruction Decoder - Behavioral
// 
// by: Stockton, Patrick
//     
// 
//////////////////////////////////////////////////////////////////////////////////

module instructionDecoder_Behavioral(
	output [13:0] F,
	input [3:0] OpCode);
    
   reg [13:0] F;
   wire [3:0] OpCode;
   wire NOT_Op0, NOT_Op1, NOT_Op2, NOT_Op3;
    
	// Begin the case check when a new OpCode has been inputted
	// These case values are from the devised Truth Table
   always @ (OpCode)
	begin
		case (OpCode)
			4'b0000 : F = 14'b00_0000_0000_0001;
			4'b0001 : F = 14'b00_0000_0000_0010;
			4'b0010 : F = 14'b00_0000_0000_0100;
			4'b0011 : F = 14'b00_0000_0000_1000;
			4'b0100 : F = 14'b00_0000_0001_0000;
			4'b0101 : F = 14'b00_0000_0010_0000;
			4'b0110 : F = 14'b00_0000_0100_0000;
			4'b0111 : F = 14'b00_0000_1000_0000;
			4'b1000 : F = 14'b00_0001_0000_0000;
			4'b1010 : F = 14'b00_0010_0000_0000;
			4'b1011 : F = 14'b00_0100_0000_0000;
			4'b1100 : F = 14'b00_1000_0000_0000;
			4'b1101 : F = 14'b01_0000_0000_0000;
			4'b1111 : F = 14'b10_0000_0000_0000;
			default : F = 14'b00_0000_0000_0000;
		endcase
	end
    
endmodule