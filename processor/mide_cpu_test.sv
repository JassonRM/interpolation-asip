`timescale 1 ps/ 1 ps
module mide_cpu_test();

logic clk, gpu_clk, reset, start_button, image_select;
logic [7:0] rgb_out;
logic [31:0] gpu_address;
logic[7:0] vram_out;
integer f;
mide_cpu DUT(clk, gpu_clk, reset, start_button, image_select, gpu_address, vram_out);

	initial begin
		//synthesis translate_off
		f = $fopen("../outputs/output.txt");
		//synthesis translate_on
		
		clk = 1;
		gpu_clk = 0;
		reset = 0;
		start_button = 0;
		image_select = 0;
		gpu_address = 0;
		
		#1000 reset = 1;
		#1000 reset = 0;
		
		
		#100000 start_button = 1;		
		#16.7ms image_select = 1; // Check time for this
	end
	
	always
	begin
		#1000 gpu_clk <= !gpu_clk;
		gpu_address <= gpu_address + 1;
		$fdisplay(f,"%b", vram_out);
	end
	always
		#1000 clk <= !clk;

endmodule 