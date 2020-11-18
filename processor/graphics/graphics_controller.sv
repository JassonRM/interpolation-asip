module graphics_controller(input logic clk, reset, write_enable, gpu_clk, image_select, button_start,
								input logic[31:0] address, address_intr, data_input,
								input logic[31:0] vector_input,
								output logic[31:0] data_output, intr_output,
								output logic[31:0] vector_output,
								output logic hsync, vsync,
								output logic[23:0] rgb_out);
	
	logic[7:0] encrypted_gpu, decrypted_gpu;
	logic[18:0] gpu_address;

	iomemory mem(clk, write_enable, gpu_clk, button_start, address, address_intr, data_input, gpu_address, vector_input, encrypted_gpu, decrypted_gpu, data_output, intr_output, vector_output);

	logic ready, den;
	logic[23:0] rgb_in;
	logic[7:0] grayscale_in;
	
	assign rgb_in = {grayscale_in, grayscale_in, grayscale_in};
	
	video_sync_generator videoSync (
		.video_sync_generator_0_clk_clk           (gpu_clk),     		      //       video_sync_generator_0_clk.clk
		.video_sync_generator_0_clk_reset_reset_n (reset), 				// video_sync_generator_0_clk_reset.reset_n
		.video_sync_generator_0_in_ready          (ready),          	//        video_sync_generator_0_in.ready
		.video_sync_generator_0_in_valid          ('b1),          	//                                 .valid
		.video_sync_generator_0_in_data           (rgb_in),           //                                 .data
		.video_sync_generator_0_in_endofpacket    ('b0),    				//                                 .endofpacket
		.video_sync_generator_0_in_startofpacket  ('b0),  					//                                 .startofpacket
		.video_sync_generator_0_in_empty          ('b0),          	//                                 .empty
		.video_sync_generator_0_sync_RGB_OUT      (rgb_out),      		//      video_sync_generator_0_sync.RGB_OUT
		.video_sync_generator_0_sync_HD           (hsync),           	//                                 .HD
		.video_sync_generator_0_sync_VD           (vsync),           	//                                 .VD
		.video_sync_generator_0_sync_DEN          (den)           		//                                 .DEN
	);
	
		logic[1:0] color_selector;
		image_controller image(
		.clk							(gpu_clk),
		.reset						(reset),
		.hsync						(hsync), 
		.vsync						(vsync), 
		.visible						(den), 
		.image_selector			(!image_select),
		.color_selector			(color_selector),
		.address					   (gpu_address)
		);
		
		color_decoder deco(color_selector, decrypted_gpu, encrypted_gpu, grayscale_in);
		

endmodule 