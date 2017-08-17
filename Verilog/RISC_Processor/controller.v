`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Control module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


// The controller module provides the various signals to each module with each
// given operation/instruction.
module controller(
		input  clk,
		input  [15:0] instr,
		output reg [2:0] alu_sel,
		output reg [1:0] rf_wr_sel,
		output reg mem_addr_sel,
		output reg rf_addr_Rp_sel, //RS Sel
		output reg rf_addr_Rq_sel, //RT Sel
		output reg rf_addr_Wr_sel, //RD Sel
		output reg mem_rd, mem_wr,
		output [7:0] D_addr,
		output [3:0] rf_addr_Rp, //RS
		output [3:0] rf_addr_Rq, //RT
		output [3:0] rf_addr_Wr, //RD
		output [7:0] imm,        //RF_W_data
		output reg IR_ld, PC_inc, PC_clr,
		//output reg [7:0] dir,        //Dir
		//output reg [7:0] PC_inc,     //PC_inc
		//output reg [7:0] PC_clr,     //PC_clr
		//output reg [7:0] PC_ld,      //PC_ld
		//output reg rf_rd_Rp, if_rd_Rq,if_wr,IR_ld, D_addr_sel, D_rd,D_wr, RF_s1, RF_s0,
		output reg [2:0] state);
		  
		wire [3:0] opcode;
		reg [2:0] next_state;
		
		// Parameters for the controller states
		parameter START = 0;	// No operation
		parameter FETCH1 = 1;	// Fetch instruction
		parameter FETCH2 = 2;	// Load from IR
		parameter DECODE = 3;	// Run OpCode cases
		parameter MEM = 4;	// Program Counter and memory write/read
		parameter EXECUTE = 5;	// Execute instr
		parameter WB = 6;	// Write Back to memory and return to FETCH1
		
		// Begin default START state
		initial 
		begin
			state = START;
		end
		
		// Proceed to next state every clock cycle
		always @ (posedge clk)
		begin
			state <= next_state;
		end
		
		 //always @ (instr or clk)
		 //begin
			assign opcode = instr[15:12];
			assign rf_addr_Rp = instr[7:4];
			assign rf_addr_Rq = instr[3:0];
			assign rf_addr_Wr = instr[11:8];
			assign imm = instr[7:0];
			assign D_addr = instr[7:0];
		 //end
		 
		 always@(*)
			begin
			$display ("Start of loop: instruction = %b", instr);	
			$display ("Start of loop: Opcode = %b", opcode);	
			next_state = state;
			case (state)
				// Reset all states/controls back to zero
				START : begin
					next_state = FETCH1;
					PC_inc = 1'b0;
					PC_clr = 1'b0;
					IR_ld = 1'b0;
					rf_addr_Rp_sel = 1'b0;
					rf_addr_Rq_sel = 1'b0;
					rf_addr_Wr_sel = 1'b0;
					mem_rd = 1'b0;
					mem_wr = 1'b0;
					mem_addr_sel = 1'b0;
					rf_wr_sel = 1'b0;
					alu_sel = 3'b000;
					$display ("START: alu_sel = %b", alu_sel);				
					end
				// Fetch the first instruction by reading from memory
				FETCH1: begin 
					next_state = FETCH2;
					mem_addr_sel = 1'b0; // Program Counter address
					mem_rd = 1'b1;
					mem_wr = 1'b0;
					PC_inc = 1'b0;
					$display ("FETCH1");	
					end
				// Load from the Instruction Register
				FETCH2: begin
					next_state = DECODE;
					IR_ld = 1'b1;
					$display ("FETCH2");	
					end
				// Decode the OpCode and trigger respective control signals to ALU and registers
				DECODE: begin
					next_state = MEM;
					IR_ld = 1'b0;
					mem_rd = 1'b0;
					mem_wr = 1'b0;
					rf_addr_Rp_sel = 1'b0;
					rf_addr_Rq_sel = 1'b0;
					$display ("DECODE");
				
					case(opcode)
								 4'b0000 : begin	// ADD
											alu_sel = 3'b000;
											rf_addr_Rp_sel = 1'b1;
											rf_addr_Rq_sel = 1'b1;
											rf_addr_Wr_sel = 1'b1;
											rf_wr_sel = 2'b00;
											$display ("ADD 0000: alu_sel = %b", alu_sel);
										end	            
								 4'b0001 : begin	// SUB
											  rf_addr_Rp_sel = 1'b1;
											  rf_addr_Rq_sel = 1'b1;
											  alu_sel = 3'b001;
											  rf_wr_sel = 2'b00;
											  $display ("SUB 0001: alu_sel = %b", alu_sel);
										end
								 4'b0010 : begin	// AND
											  rf_addr_Rp_sel = 1'b1;
											  rf_addr_Rq_sel = 1'b1;
											  alu_sel = 3'b010;
											  rf_wr_sel = 2'b00;
											  $display ("AND 0010: alu_sel = %b", alu_sel);
										end
								 4'b0011 : begin	// OR
											  rf_addr_Rp_sel = 1'b1;
											  rf_addr_Rq_sel = 1'b1;
											  alu_sel = 3'b011;
											  rf_wr_sel = 2'b00;
											  $display ("OR 0011: alu_sel = %b", alu_sel);
										end
								 4'b0100 : begin	// XOR
											  rf_addr_Rp_sel = 1'b1;
											  rf_addr_Rq_sel = 1'b1;
											  alu_sel = 3'b100;
											  rf_wr_sel = 2'b00;
											  $display ("XOR 0100: alu_sel = %b", alu_sel);
										end
								 4'b0101 : begin	// NOT
											  rf_addr_Rp_sel = 1'b1;
											  //rf_addr_Rq_sel = 1'b1;
											  alu_sel = 3'b101;
											  rf_wr_sel = 2'b00;
											  $display ("NOT 0101: alu_sel = %b", alu_sel);
										end
								 4'b0110 : begin	// SLA
											  rf_addr_Rp_sel = 1'b1;
											  alu_sel = 3'b110;
											  rf_wr_sel = 2'b00;
											  $display ("SLA 0110: alu_sel = %b", alu_sel);
										end
								 4'b0111 : begin	// SRA
											  rf_addr_Rp_sel = 1'b1;
											  alu_sel = 3'b111;
											  rf_wr_sel = 2'b00;
											  $display ("SRA 0111: alu_sel = %b", alu_sel);
										end
								 4'b1001 : begin	// LD
											 mem_rd = 1'b1;
											 mem_addr_sel = 1'b1;
											 rf_wr_sel = 2'b01;
											 $display ("LD 1001: alu_sel = %b", alu_sel);
									  end
								 4'b1010 : begin	// SW
											 mem_wr = 1'b1;
											 mem_addr_sel = 1'b1;
											 rf_addr_Rp_sel = 1'b1;
											 $display ("SW 1010: alu_sel = %b", alu_sel);
										end
							endcase
				
				
					/*case(opcode)
					4'b0000: //ADD
						begin
							alu_sel = 3'b000;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
							rf_addr_Rq_sel = 1'b1;
							rf_addr_Rq = instr[3:0];
							rf_wr_sel = 2'b00;
						end
					4'b0001: //SUB
						begin
							alu_sel = 3'b001;
							rf_wr_sel = 2'b00;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
							rf_addr_Rq_sel = 1'b1;
							rf_addr_Rq = instr[3:0];
						end
					4'b0010: //AND
						begin
							alu_sel = 3'b010;
							rf_wr_sel = 2'b00;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
							rf_addr_Rq_sel = 1'b1;
							rf_addr_Rq = instr[3:0];
						end
					4'b0011: //OR
						begin
							alu_sel = 3'b011;
							rf_wr_sel = 2'b00;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
							rf_addr_Rq_sel = 1'b1;
							rf_addr_Rq = instr[3:0];
						end
					4'b0100: //XOR
						begin
							alu_sel = 3'b100;
							rf_wr_sel = 2'b00;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
							rf_addr_Rq_sel = 1'b1;
							rf_addr_Rq = instr[3:0];
						end
					4'b0101: //NOT
						begin
							alu_sel = 3'b101;
							rf_wr_sel = 2'b00;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
						end
					4'b0110: //SLA
						begin
							alu_sel = 3'b110;
							rf_wr_sel = 2'b00;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
						end
					4'b0111: //SRA
						begin
							alu_sel = 3'b111;
							rf_wr_sel = 2'b00;
							rf_addr_Wr_sel = 1'b1;
							rf_addr_Wr = instr[11:8];
							rf_addr_Rp_sel = 1'b1;
							rf_addr_Rp = instr[7:4];
						end
					4'b1000: //LD
						begin
							mem_rd = 1'b1;
							mem_addr_sel = 1'b1;
							rf_wr_sel = 2'b01;
						end
					//4'b1000: //LI
					//	begin
					//		rf_addr_Wr_sel = 1'b1;
					//		rf_addr_Wr = instr[11:8];
					//		imm = instr[7:0];
					//	end	
					//4'b1001: //LW
					//	begin
					//		rf_addr_Wr_sel = 1'b1;
					//		rf_addr_Wr = instr[11:8];
					//		dir = instr[7:0];
					//	end
					4'b1010: //SW
						begin
							mem_wr = 1'b1;
							mem_addr_sel = 1'b1;
							rf_addr_Rp_sel = 1'b1;
							//rf_addr_Rq_sel = 1'b1;
							//rf_addr_Rq = instr[11:8];
							//dir[7:4] = instr[7:4];
							//dir[3:0] = instr[3:0];
						end
					//4'b1011://BIZ
					//	begin
					//		rf_addr_Rp_sel = 1'b1;
					//		rf_addr_Rp = instr[11:8]; //If all values are 0, then OFFSET
					//		PC_inc = instr[7:0];
					//		PC_ld = 1'b1;
					//		//PC_clr???
					//	end
					//4'b1100://BNZ      Same as BIZ??
					//	begin
					//		rf_addr_Rp_sel = 1'b1;
					//		rf_addr_Rp = instr[11:8]; //If all values are 0, then OFFSET
					//		PC_inc = instr[7:0];
					//		PC_ld = 1'b1;
					//		//PC_clr ???
					//	end
					//4'b1101://JAL
					//	begin
					//		rf_addr_Wr_sel = 1'b1;
					//		rf_addr_Wr = instr[11:8]; //If all values are 0, then OFFSET
					//		PC_inc = instr[7:0];
					//		PC_ld =1'b1;
					//	end
					//4'b1110://JMP
					//	begin
					//		PC_inc = instr[7:0];
					//		PC_ld =1'b1;
					//	end
					//4'b1111://JR
					//	begin
					//		rf_addr_Rp_sel = 1'b1;
					//		rf_addr_Rp = instr[7:4]; //If all values are 0, then OFFSET
					//		PC_ld =1'b1;
					//	end
						
					endcase*/
					end
				// Increment Program Counter, check to see if memory read and RF write is triggered
				MEM: begin
					$display ("MEM");
					PC_inc = 1'b1;
					if ( mem_rd == 1'b1 && rf_addr_Wr_sel == 1'b0 ) begin
						next_state = WB;
						rf_addr_Wr_sel = 1'b1;    
					end else if ( mem_rd == 1'b0 && rf_addr_Wr_sel == 1'b1 ) begin
						next_state = FETCH1;
					end else if ( mem_rd == 1'b0 && rf_addr_Wr_sel == 1'b0 ) begin
						next_state = WB;
						rf_addr_Wr_sel = 1'b1; 
					end
				end
				// Write Back to memory, and begin FETCH1 again
				WB: begin
					$display ("WB");
					PC_inc = 1'b0;
					rf_addr_Rp_sel = 1'b0;
					rf_addr_Rq_sel = 1'b0;
					next_state = FETCH1;
					rf_addr_Wr_sel = 1'b0;
					mem_rd = 1'b0; 
					//rf_addr_Wr_sel = 1;       
				  end
			endcase
			$display ("End of controller: alu_sel = %b", alu_sel);
			$display (" ");
		 end
							     
endmodule
