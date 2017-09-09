`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Instruction Decoder - Gate Level
// 
// by: Stockton, Patrick
//    
// 
//////////////////////////////////////////////////////////////////////////////////


module instructionDecoder_GateLevel(
    output [13:0] F,
	input [3:0] OpCode);
    
    //reg [13:0] F;
	//wire [3:0] OpCode;
    wire NOT_Op0, NOT_Op1, NOT_Op2, NOT_Op3;
    
    // Gate level method, can declare outputs via truth table/K-map results
    begin
    
		not (NOT_Op3, OpCode[3]); // ~A
		not (NOT_Op2, OpCode[2]); // ~B
		not (NOT_Op1, OpCode[1]); // ~C
		not (NOT_Op0, OpCode[0]); // ~D

		// Truth Table & K-map Declarations (OP Code)
		and Gate0(F[0], NOT_Op3, NOT_Op2, NOT_Op1, NOT_Op0);
		and Gate1(F[1], NOT_Op3, NOT_Op2, NOT_Op1, OpCode[0]);
		and Gate2(F[2], NOT_Op3, NOT_Op2, OpCode[1], NOT_Op0);
		and Gate3(F[3], NOT_Op3, NOT_Op2, OpCode[1], OpCode[0]);
		and Gate4(F[4], NOT_Op3, OpCode[2], NOT_Op1, NOT_Op0);
		and Gate5(F[5], NOT_Op3, OpCode[2], NOT_Op1, OpCode[0]);
		and Gate6(F[6], NOT_Op3, OpCode[2], OpCode[1], NOT_Op0);
		and Gate7(F[7], NOT_Op3, OpCode[2], OpCode[1], OpCode[0]);
		and Gate8(F[8], OpCode[3], NOT_Op2, NOT_Op1, NOT_Op0);
		and Gate9(F[9], OpCode[3], NOT_Op2, OpCode[1], NOT_Op0);
		and Gate10(F[10], OpCode[3], NOT_Op2, OpCode[1], OpCode[0]);
		and Gate11(F[11], OpCode[3], OpCode[2], NOT_Op1, NOT_Op0);
		and Gate12(F[12], OpCode[3], OpCode[2], NOT_Op1, OpCode[0]);
		and Gate13(F[13], OpCode[3], OpCode[2], OpCode[1], OpCode[0]);
    
    end
    
endmodule

