`timescale 1 ps/ 1 ps
module mide_cpu_test();

logic clk, gpu_clk, reset, start_button, image_select;
logic [7:0] rgb_out;
logic [31:0] gpu_address;
logic[7:0] vram_out;
integer f,i;
mide_cpu DUT(clk, gpu_clk, reset, start_button, image_select, gpu_address, vram_out);



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
		//write_data = $fopen("C:/rsa-asip/results/encrypted.txt");
		// synthesis translate_on
		
		#100000 start_button = 1;		
		#16.7ms image_select = 1;
		
		// synthesis translate_off
		//write_data = $fopen("C:/rsa-asip/results/decrypted.txt");
		// synthesis translate_on
		
		f = $fopen("C:/Users/WPC/Documents/proyecto2_arqui2/interpolation-asip/outputs/output.txt");
		#400;
		for (i = 0; i < 90000; i = i +1)begin
			@(posedge clk);
			gpu_address <= i;
			#200;
			$fwrite(f,"%b", vram_out);
			#200;
		end
		
	end
	
	always
	begin
		#7692 gpu_clk <= !gpu_clk;
		//$fdisplay(write_data, "%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
//		$display("%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
	end
	always
		#1000 clk <= !clk;

endmodule 