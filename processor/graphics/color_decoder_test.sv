
`timescale 1ps / 1ps
module color_decoder_test();
	
	logic[1:0] color_selector;
	logic[7:0] first_color, second_color, out_color;
	
	color_decoder DUT (color_selector, first_color, second_color, out_color);
	
	initial begin
		color_selector = 2'b00;
		first_color = 8'd120;
		second_color = 8'd210;
		
		#10 color_selector = 2'b00;
		#1 assert(out_color == first_color) $display("1st color_decoder_test successful");
		else $error("1st color_decoder_test failed");
		
		#10 color_selector = 2'b01;
		#1 assert(out_color == second_color) $display("2nd color_decoder_test successful");
		else $error("2nd color_decoder_test failed");
		
		#10 color_selector = 2'b10;
		#1 assert(out_color == 8'd0) $display("3rd color_decoder_test successful");
		else $error("3rd color_decoder_test failed");
		
		#10 color_selector = 2'b11;
		#1 assert(out_color == 8'd0) $display("4th color_decoder_test successful");
		else $error("4th color_decoder_test failed");
		
		#10 color_selector = 2'b01;
		
		#10 color_selector = 2'b00;
	
	end
endmodule 