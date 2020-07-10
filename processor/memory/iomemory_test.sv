`timescale 1 ps / 1 ps

module iomemory_test();

logic clk, write_enable, gpu_clk, gpu_sel;
logic[31:0] address, data_input, gpu_address;
logic[63:0] vector_input;
logic[7:0] gpu_out;
logic[31:0] data_output;
logic[127:0] vector_output;

	iomemory DUT(clk, write_enable, gpu_clk, gpu_sel, address, data_input, gpu_address, vector_input, gpu_out, data_output, vector_output);

	initial begin
		clk = 0; write_enable = 0; gpu_clk = 0; gpu_sel = 0; address = 'h0; data_input = 'hA; gpu_address = 0; vector_input = 'h0;

		#10 address = 32'h100;
		#10 write_enable = 1;
		#20 write_enable = 0;
		#40 address = 32'h404; vector_input = 'h1234567890ABCDEF;
		#10 write_enable = 1;
		#10 write_enable = 0;
		
		
		#30 address = 32'h30000;
		#30 address = 32'h30004;
	end


	always #1 gpu_clk <= !gpu_clk;
	always #1 gpu_address = gpu_address + 1;
	always #5 clk <= !clk;
	
endmodule