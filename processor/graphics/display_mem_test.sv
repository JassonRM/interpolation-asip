`timescale 1 ps / 1 ps
module display_mem_test();

	logic clk, write_enable_a, write_enable_b;
	logic[14:0] address_a;
	logic[18:0] address_b;
	logic[127:0] data_a, out_a;
	logic[7:0] data_b, out_b;

	rom_encrypted mem (address_a, address_b, clk, clk, out_a, out_b);
	//rom_encrypted Encrypted(encrypted_address, gpu_address, clk, gpu_clk, vector_output, encrypted_gpu);

	logic reset, ready, valid, eop, sop, empty, hsync, vsync, den;
	
	logic[23:0] data_in, data_out;
	
	logic[7:0] r, g, b;
	
	assign r = data_out[23:16];
	assign g = data_out[15:8];
	assign b = data_out[7:0];
	
	assign data_in = {out_b, out_b, out_b};
	
	video_sync_generator DUT (
		.video_sync_generator_0_clk_clk           (clk),     		      //       video_sync_generator_0_clk.clk
		.video_sync_generator_0_clk_reset_reset_n (reset), 				// video_sync_generator_0_clk_reset.reset_n
		.video_sync_generator_0_in_ready          (ready),          	//        video_sync_generator_0_in.ready
		.video_sync_generator_0_in_valid          (valid),          	//                                 .valid
		.video_sync_generator_0_in_data           (data_in),           //                                 .data
		.video_sync_generator_0_in_endofpacket    (eop),    				//                                 .endofpacket
		.video_sync_generator_0_in_startofpacket  (sop),  					//                                 .startofpacket
		.video_sync_generator_0_in_empty          (empty),          	//                                 .empty
		.video_sync_generator_0_sync_RGB_OUT      (data_out),      		//      video_sync_generator_0_sync.RGB_OUT
		.video_sync_generator_0_sync_HD           (hsync),           	//                                 .HD
		.video_sync_generator_0_sync_VD           (vsync),           	//                                 .VD
		.video_sync_generator_0_sync_DEN          (den)           		//                                 .DEN
	);

	
	logic image_selector;
	logic[1:0] color_selector;
	
	
	image_controller img_controller(
		.clk							(clk),
		.reset						(reset),
		.hsync						(hsync), 
		.vsync						(vsync), 
		.visible						(den), 
		.image_selector			(image_selector),
		.color_selector			(color_selector),
		.address					(address_b)
		);
	
	integer write_data;
	
	initial begin
		clk = 0;
		reset = 1;
		valid = 1;
		sop = 0;
		empty = 0;
		
		image_selector = 1;
		
		write_enable_a = 0;
		write_enable_b = 0;
		address_a = 15'd0;
		data_a = 'z;
		data_b = 'z;
		
		// synthesis translate_off
		write_data = $fopen("/home/marco/Documents/Projects/vga-sandbox/vga_write.txt");
		// synthesis translate_on
		
		#10 reset = 0;
		#10 reset = 1;

	end	
	
	
	always_ff @(posedge clk)
	begin
		
		if(color_selector == 2'b10)
		begin
			$fdisplay(write_data, "%0d ps: %b %b 11111111 00000000 00000000", $time, hsync, vsync);
			$display("%0d ps: %b %b 00000000 00000000 00000000", $time, hsync, vsync);
		end
		else
		begin
			$fdisplay(write_data, "%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
			$display("%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
		end
	end

	always
		#7692 clk <= !clk;

endmodule 