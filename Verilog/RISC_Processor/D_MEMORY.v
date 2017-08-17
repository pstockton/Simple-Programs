`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Data Memory module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


module D_MEMORY (
     input clk,
     input read, write,
     input [7:0] address,
     input [15:0] W_data_in,
     output reg [15:0] R_data_out);

		reg [15:0] memory [255:0];

		// Need to test some operations through the control unit
		// Need to load two values, perform an operation, and store
		initial 
		begin
			//memory[0] = 16'b0000_0000_0000_0000;
		
			// Add #4 and #12
			memory[5] = 16'b1001_0001_00011110; //LD R1, R30 = #4
			memory[6] = 16'b1001_1011_00001100; //LD R2, R12 = #12
			memory[7] = 16'b0000_0011_0001_0010; //ADD R3, R1, R2
			memory[8] = 16'b1010_0011_00010000; //SW R3, #16

			memory[1] = 16'b1001_0010_00010000; //LD R2, R16 = #16
			memory[2] = 16'b1001_0011_00011110; //LD R3, R30 = #4
			memory[3] = 16'b0001_0100_0010_0011; //SUB R4, R2, R3
			memory[4] = 16'b1010_0100_00001100; //SW R4, R12 = #12
			
			//memory[9] = 16'b1001_0110_00010001; //LD R6, R17 = #31
			//memory[10] = 16'b0101_0111_00000110; //NOT R7, R6
			
			memory[30] = 16'b0000_0000_0000_0100; // #4
			memory[12] = 16'b0000_0000_0000_1100; // #12
			memory[11] = 16'b0000_0000_0000_1100; // #12 memory[6] destination
			memory[16] = 16'b0000_0000_0001_0000; // #16
			memory[17] = 16'b0000_0000_0001_1111; // #31
			/*
			// Memory[12:15] = destination registers
			// Memory[30:63] = immediates and other values
			memory[0] = 16'b1001_1100_00011110; //LD R12, R30 = #4
			memory[1] = 16'b1001_1101_00011111; //LD R13, R31 = #12
			//memory[2] = 16'b0000_1110_1100_1101; //ADD R14, R12, R13
			memory[2] = 16'b0001_1110_1100_1101; //SUB R14, R12, R13
			memory[3] = 16'b1010_1110_00100000; //SW R14, #16

			memory[4] = 16'b1001_1100_00100000; //LD R12, R32 = #16
			memory[5] = 16'b1001_1101_00011110; //LD R13, R30 = #4
			//memory[6] = 16'b0001_1110_1100_1101; //SUB R14, R12, R13
			memory[6] = 16'b0000_1110_1100_1101; //ADD R14, R12, R13
			memory[7] = 16'b1010_1110_00011111; //SW R14, R31 = #12
			
			
			memory[30] = 16'b0000_0000_0000_0100; // #4
			memory[31] = 16'b0000_0000_0000_1100; // #12
			memory[32] = 16'b0000_0000_0001_0000; // #16
			*/
			
		end

		always @ (posedge clk) 
		begin
			 if (write == 1) begin
				  memory[address] <= W_data_in;
			 end
			 if (read == 1) begin
				  R_data_out <= memory[address];
			 end
		end
endmodule