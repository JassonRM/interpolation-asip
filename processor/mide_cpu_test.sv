`timescale 1 ps/ 1 ps
module mide_cpu_test();

logic clk, gpu_clk, reset, start_button, image_select;
logic [7:0] rgb_out;
logic [31:0] gpu_address;
logic[7:0] vram_out;
integer f, i;
mide_cpu DUT(clk, gpu_clk, reset, start_button, image_select, gpu_address, vram_out);

	initial begin
		
		clk = 1;
		gpu_clk = 0;
		reset = 0;
		start_button = 0;
		image_select = 0;
		gpu_address = 0;
		
		#1000 reset = 1;
		#1000 reset = 0;
		
		
		#100000 start_button = 1;		
		#2000000 image_select = 1; // Check time for this
		
		//synthesis translate_off
		f = $fopen("D:/interpolation-asip/outputs/output.txt");
		//synthesis translate_on
		#400;
		for (i = 0; i < 90000; i = i + 1)begin
			@(posedge clk);
			gpu_address <= i;
			#200;
			$fdisplay(f,"%b", vram_out);
			#200;
		end
	end
	
	always
	begin
		#1000 gpu_clk <= !gpu_clk;
	end
	always
		#1000 clk <= !clk;

endmodule 