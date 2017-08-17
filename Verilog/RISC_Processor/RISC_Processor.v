`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-bit RISC Processor - Upper Module
//
//////////////////////////////////////////////////////////////////////////////////

module RISC_Processor(
		input clk, reset,
		output [15:0] instruction,
		output [2:0] alu_sel,
		output [1:0] rf_wr_sel,
		output  mem_addr_sel,
		output [7:0] D_addr,  
		output  rf_Rp_rd, rf_Rq_rd, rf_wr, mem_rd, mem_wr,
		output [3:0] rf_addr_Rp, rf_addr_Rq, rf_addr_Wr,
		output [7:0] immediate,
		output IR_ld, PC_inc, PC_clr,
		output [7:0] PC_addr, mem_addr,
		output [15:0] alu_out, mem_out,
		output [15:0] rf_in, rf_out1, rf_out2,
		output [2:0] state);
    
		controller Unit0 (clk,instruction,alu_sel,rf_wr_sel,mem_addr_sel, rf_Rp_rd,rf_Rq_rd,rf_wr,mem_rd,mem_wr,D_addr,rf_addr_Rp,rf_addr_Rq,rf_addr_Wr, immediate,IR_ld,PC_inc,PC_clr,state);
		PC         Unit1 (clk,PC_clr,PC_inc,PC_addr);    
		IR         Unit2 (clk,IR_ld,mem_out,instruction);
		RF_MUX     Unit3 (alu_out,mem_out,immediate,rf_wr_sel,rf_in);
		D_ADDR_MUX Unit4 (PC_addr,D_addr,mem_addr_sel,mem_addr);
		D_MEMORY   Unit5 (clk,mem_rd,mem_wr,mem_addr,rf_out1,mem_out);
		RF         Unit6 (clk,rf_Rp_rd,rf_Rq_rd,rf_wr,rf_addr_Rp,rf_addr_Rq,rf_addr_Wr,rf_in,rf_out1,rf_out2);
		alu_16bit Unit7 (rf_out1, rf_out2, alu_sel, alu_out);

endmodule
