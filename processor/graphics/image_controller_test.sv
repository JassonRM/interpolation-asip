`timescale 1 ps / 1 ps
module image_controller_test();

	logic clk, reset, ready, valid, eop, sop, empty, hsync, vsync, den;
	
	logic[23:0] data_in, data_out;
	
	logic[7:0] r, g, b;
	
	assign r = data_out[23:16];
	assign g = data_out[15:8];
	assign b = data_out[7:0];
	
	video_sync_generator video_sync (
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
	
	logic[17:0] address1;
	logic[18:0] address2;
	
	image_controller DUT(
		.clk							(clk),
		.reset						(reset),
		.hsync						(hsync), 
		.vsync						(vsync), 
		.visible						(den), 
		.image_selector			(image_selector),
		.color_selector			(color_selector),
		.address1					(address1),
		.address2					(address2)
		);
	
	
	initial begin
		clk = 0;
		reset = 1;
		valid = 1;
		sop = 0;
		empty = 0;
		data_in = 24'b000000001111111100000000;
		
		image_selector = 0;
		
		#10 reset = 0;
		#10 reset = 1;

	end
	
	always
		#7692 clk <= !clk;
	
endmodule 