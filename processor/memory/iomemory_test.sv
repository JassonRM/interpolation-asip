`timescale 1 ps / 1 ps

module iomemory_test();

	logic clk, write_enable, gpu_clk, button_start;
	logic[31:0] address, address_intr, data_input, gpu_address;
	logic[63:0] vector_input;
	logic[7:0] encrypted_gpu, decrypted_gpu;
	logic[31:0] data_output, intr_output;
	logic[127:0] vector_output;

					
	iomemory DUT(clk, write_enable, gpu_clk, button_start, address, address_intr, data_input, gpu_address, vector_input, encrypted_gpu, decrypted_gpu, data_output, intr_output, vector_output);

	initial begin
		clk = 0; write_enable = 0; gpu_clk = 0; address = 'h0; data_input = 'hA; gpu_address = 0; vector_input = 'h0; address_intr = 'h10; button_start = 0;

		#10 address = 32'h10;
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