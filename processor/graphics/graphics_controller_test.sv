
`timescale 1ps/1ps
module graphics_controller_test();
	
	logic clk, reset, write_enable, gpu_clk, image_select, button_start, hsync, vsync;
	logic[31:0] address, address_intr, data_input, data_output, intr_output;
	logic[63:0] vector_input;
	logic[127:0] vector_output;
	logic[23:0] rgb_out;
	
	logic[7:0] r, g, b;
	
	assign r = rgb_out[23:16];
	assign g = rgb_out[15:8];
	assign b = rgb_out[7:0];
	
	graphics_controller DUT(clk, reset, write_enable, gpu_clk, image_select, button_start, address, address_intr, data_input, vector_input, data_output, intr_output, vector_output, hsync, vsync, rgb_out);
	
	integer write_data;

	initial begin
		
		clk = 0; 
		reset = 1;
		write_enable = 0;
		gpu_clk = 0;
		image_select = 0;
		
		address = 'd0;
		data_input = 'd0;
		vector_input = 'd0;
		
		// synthesis translate_off
		write_data = $fopen("/home/marco/Documents/Projects/vga-sandbox/vga_write.txt");
		// synthesis translate_on
		
		#10 reset = 0;
		#10 reset = 1;
		
		
	end
	
	always
	begin
		#7692 gpu_clk <= !gpu_clk;
		$fdisplay(write_data, "%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
		$display("%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
	end
	always
		#3846 clk <= !clk;
	
endmodule 