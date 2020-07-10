
`timescale 1 ps / 1 ps
module video_sync_generator_test();
	
	logic clk, reset, ready, valid, eop, sop, empty, hsync, vsync, den;
	
	logic[23:0] data_in, data_out;
	
	logic[7:0] r, g, b;
	
	integer write_data;
	
	assign r = data_out[23:16];
	assign g = data_out[15:8];
	assign b = data_out[7:0];
	
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

	
	initial begin
		clk = 0;
		reset = 1;
		valid = 1;
		sop = 0;
		empty = 0;
		data_in = 24'b000000001111111100000000;
		
		// synthesis translate_off
		write_data = $fopen("/home/marco/Documents/Projects/vga-sandbox/vga_write.txt");
		// synthesis translate_on
		
		#10 valid = 1;
		sop = 1;
		reset = 0;
		#10 sop = 0;
		reset = 1;
		
		
		#1000000000 data_in = 24'b111111110000000000000000;
		#1000000000 data_in = 24'b000000000000000011111111;
	end

	
	always_ff @(posedge clk)
	begin
		$fdisplay(write_data, "%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
		$display("%0d ps: %b %b %b %b %b", $time, hsync, vsync, r, g, b);
	end
	
	always
		#7692 clk <= !clk;
	
	endmodule 