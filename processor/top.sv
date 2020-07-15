module top (input logic clk, rst, start_button, image_select,
					output logic hsync, vsync,
					output logic[23:0] rgb_out);
					
	mide_cpu processor (clk, gpu_clk, rst, start_button, image_select, hsync, vsync, rgb_out);

	logic gpu_clk, locked;
	clk_controller clock(clk, rst, gpu_clk, locked);
	
endmodule 