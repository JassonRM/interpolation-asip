`timescale 1 ps/ 1 ps
module mide_cpu_test();

logic clk, reset, start_button, image_select, interpolation_type;
logic [3:0] quadrant;
logic [7:0] rgb_out;
logic [31:0] gpu_address;
logic[7:0] vram_out;
integer f, i;
mide_cpu DUT(clk, clk, reset, start_button, image_select, interpolation_type, quadrant, gpu_address, vram_out);

	initial begin
		
		clk = 1;
		reset = 0;
		start_button = 0;
		image_select = 0;
		interpolation_type = 0;
		quadrant = 0;
		gpu_address = 0;
		
		#1000 reset = 1;
		#1000 reset = 0;
		
		#10ns start_button = 1;
		#10ns start_button = 0;
		
		// Write original image
		image_select = 0;
		
		//synthesis translate_off
		f = $fopen("A:/interpolation-asip/outputs/original.txt");
		//synthesis translate_on
		for (i = 0; i < 160000; i = i + 1)
			begin
				gpu_address <= i;
				@(posedge clk)
					$fdisplay(f,"%b", vram_out);
			end
	
	
		// Write nearest neighbor image
		#150ns image_select = 1;
		
		//synthesis translate_off
		f = $fopen("A:/interpolation-asip/outputs/nearest_neighbor.txt");
		//synthesis translate_on
		for (i = 0; i < 90000; i = i + 1)
			begin
				gpu_address <= i;
				@(posedge clk)
					$fdisplay(f,"%b", vram_out);
			end
			
		// Write bilinear image
		interpolation_type = 1;
		start_button = 1;
		#10ns start_button = 0; 
		
		#150ns
		//synthesis translate_off
		f = $fopen("A:/interpolation-asip/outputs/bilinear.txt");
		//synthesis translate_on
		for (i = 0; i < 90000; i = i + 1)
			begin
				gpu_address <= i;
				@(posedge clk) 
					$fdisplay(f,"%b", vram_out);
			end
	end
	
	always
		#1000 clk <= !clk;

endmodule 