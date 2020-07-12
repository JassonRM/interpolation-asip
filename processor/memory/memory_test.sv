`timescale 1 ps/ 1 ps
module memory_test();

	logic clk, gpu_clk, reset, button_start, image_select, write_enable, select_alu;
	logic[31:0] data_address, instr_address, data_input, ALUresult;
	logic[63:0] vector_input;
	logic[255:0] VALUresult;
	logic[31:0] data_output, instr_output;
	logic[127:0] vector_output;
   logic hsync, vsync;
   logic[23:0] rgb_out;
	logic[255:0] ALUoutput;

	memory DUT(clk, gpu_clk, reset, button_start, image_select, write_enable, select_alu, data_address, instr_address, data_input, ALUresult,
				  vector_input, VALUresult, data_output, instr_output, vector_output, hsync, vsync, rgb_out, ALUoutput);
					
	initial begin
		clk = 0;
		gpu_clk = 0;
		reset = 1;
		button_start = 0;
		image_select = 0;
		write_enable = 0;
		select_alu = 0;
		data_address = 'd0;
		instr_address = 'd0;
		data_input = 'd0;
		ALUresult = 'd0;
		vector_input = 'd0;
		VALUresult = 'd0;
		
		#10 reset = 0;
		#10 reset = 0;
		
		#20 ALUresult = 'd20;
		#20 VALUresult = 'd9238;
		#20 select_alu = 1'b1;
	end
		always
	begin
		#7692 gpu_clk <= !gpu_clk;
	end
	always
		#10 clk <= !clk;

endmodule 