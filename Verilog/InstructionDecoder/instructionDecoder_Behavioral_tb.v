`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//  Instruction Decoder - Behavioral - Test Bench
// 
// by: Stockton, Patrick
//     
// 
//////////////////////////////////////////////////////////////////////////////////

module instructionDecoder_Behavioral_tb;

	reg [3:0] OpCode;
	wire [13:0] F;

	// Instantiate the Unit Under Test (UUT)
	instructionDecoder_Behavioral uut (.F(F),.OpCode(OpCode));

	initial begin
		OpCode = 0;

		#100;
		OpCode = 4'b0000;
		#20;
		OpCode = 4'b0001;
		#20;
		OpCode = 4'b0010;
		#20;
		OpCode = 4'b0011;
		#20;
		OpCode = 4'b0100;
		#20;
		OpCode = 4'b0101;
		#20;
		OpCode = 4'b0110;
		#20;
		OpCode = 4'b0111;
		#20;
		OpCode = 4'b1000;
		#20;
		OpCode = 4'b1001;
		#20;
		OpCode = 4'b1010;
		#20;
		OpCode = 4'b1011;
		#20;
		OpCode = 4'b1100;
		#20;
		OpCode = 4'b1101;
		#20;
		OpCode = 4'b1110;
		#20;
		OpCode = 4'b1111;
	end
      
endmodule

