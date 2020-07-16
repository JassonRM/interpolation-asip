`timescale 1 ps/ 1 ps
module mide_cpu_test();

logic clk, gpu_clk, reset, start_button, image_select, hsync, vsync;
logic [7:0] r, g, b;
logic [23:0] rgb_out;

assign r = rgb_out[23:16];
assign g = rgb_out[15:8];
assign b = rgb_out[7:0];
	
mide_cpu DUT(clk, gpu_clk, reset, start_button, image_select, hsync, vsync, rgb_out);



integer write_data;

	initial begin
		clk = 1;
		gpu_clk = 0;
		reset = 0;
		start_button = 0;
		image_select = 0;
		
		#1000 reset = 1;
		#1000 reset = 0;
		
		// synthesis translate_off
		write_data = $fopen("C:/rsa-asip/results/encrypted.txt");
		// synthesis translate_on
		
		#100000 start_button = 1;		
		#16.7ms image_select = 1;
		
		// synthesis translate_off
		write_data = $fopen("C:/rsa-asip/results/decrypted.txt");
		// synthesis translate_on
		
	end
	
	always
	begin
		#7692 gpu_clk <= !gpu_clk;
		$fdisplay(write_data, "%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
//		$display("%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
	end
	always
		#1000 clk <= !clk;

endmodule 