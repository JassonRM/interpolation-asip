module color_decoder(input logic[1:0] color_selector, 
							input logic[7:0] first_color, second_color,
							output logic[7:0] out_color);
	always_comb 
		case (color_selector)
			
				2'b00 : out_color = first_color;
				2'b01 : out_color = second_color;
				default : out_color= 'd0;
			
		endcase 
endmodule 