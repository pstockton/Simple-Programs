`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Register File module for the 16-bit RISC Processor
//
//////////////////////////////////////////////////////////////////////////////////


module RF (
		input clk, 
		input  read_Rp, read_Rq, write, 
		input [3:0] reg_num_Rp, reg_num_Rq, reg_num_wr,
		input [15:0] rf_in_value,
		output reg [15:0] rf_out_Rp, rf_out_Rq);

		reg [15:0] register [3:0];
				  
					 
		always@(posedge clk)
		begin
			 if (read_Rp == 1) begin
				  rf_out_Rp <= register[reg_num_Rp];
			 end
			 if (read_Rq == 1) begin
				  rf_out_Rq <= register[reg_num_Rq];    
			 end
			 if (write == 1) begin
				 register[reg_num_wr] <= rf_in_value;    
			 end
		end
endmodule