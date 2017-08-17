`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// 	16-bit RISC Processor Test Bench
// 
////////////////////////////////////////////////////////////////////////////////

module RISC_Processor_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] instruction;
	wire [2:0] alu_sel;
	wire [1:0] rf_wr_sel;
	wire mem_addr_sel;
	wire rf_Rp_rd;
	wire rf_Rq_rd;
	wire rf_wr;
	wire mem_rd;
	wire mem_wr;
	wire [3:0] rf_addr_Rp;
	wire [3:0] rf_addr_Rq;
	wire [3:0] rf_addr_Wr;
	wire [7:0] D_addr;
	wire IR_ld;
	wire PC_inc;
	wire PC_clr;
	wire [7:0] immediate;
	wire [7:0] PC_addr;
	wire [7:0] mem_addr;
	wire [15:0] alu_out;
	wire [15:0] mem_out;
	wire [15:0] rf_in;
	wire [15:0] rf_out1;
	wire [15:0] rf_out2;
	wire [2:0] state;

	// Instantiate the Unit Under Test (UUT)
	RISC_Processor uut (
		.clk(clk), 
		.reset(reset), 
		.instruction(instruction), 
		.alu_sel(alu_sel), 
		.rf_wr_sel(rf_wr_sel), 
		.mem_addr_sel(mem_addr_sel), 
		.rf_Rp_rd(rf_Rp_rd), 
		.rf_Rq_rd(rf_Rq_rd), 
		.rf_wr(rf_wr), 
		.mem_rd(mem_rd), 
		.mem_wr(mem_wr), 
		.rf_addr_Rp(rf_addr_Rp), 
		.rf_addr_Rq(rf_addr_Rq), 
		.rf_addr_Wr(rf_addr_Wr), 
		.D_addr(D_addr), 
		.IR_ld(IR_ld), 
		.PC_inc(PC_inc), 
		.PC_clr(PC_clr), 
		.immediate(immediate), 
		.PC_addr(PC_addr), 
		.mem_addr(mem_addr), 
		.alu_out(alu_out), 
		.mem_out(mem_out),  
		.rf_in(rf_in), 
		.rf_out1(rf_out1), 
		.rf_out2(rf_out2),
		.state(state));


	always
	begin
		#10;
		clk = ~clk;
	end
	
	
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1'b1;
		
		#50;
		reset = 1'b0;
        
		// Add stimulus here

	end
      
endmodule

