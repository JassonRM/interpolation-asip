module image_controller #(width1 = 480, height1 = 320, width2 = 480, height2 = 640)
							  (input logic clk, reset, hsync, vsync, visible, image_selector,
								output logic[1:0] color_selector,
								output logic[17:0] address1,
								output logic[18:0] address2);
		
		
		logic inbounds1, inbounds2;
		logic[10:0] h_count; 
		logic[9:0] v_count;
		
		always_ff @(posedge clk, negedge reset)
		begin
			
			if (!reset) 
			begin
				h_count = 0;
				v_count = 0;
			end
			
			else
			begin
				
				if (!vsync && v_count != 10'd0)
					v_count = 0;
				
				else if (!hsync && h_count != 11'd0)
				begin
					v_count = v_count + 10'd1;
					h_count = 0;
				end
				
				else if (visible)
					h_count = h_count + 11'd1;
				
			end
		
		end
		
		assign inbounds1 = h_count < width1 && v_count < height1;
		assign inbounds2 = h_count < width2 && v_count < height2;
		
		
		always_comb
		
			case ({inbounds2 && image_selector, inbounds1 && !image_selector})
			
				2'b00 : color_selector = 2'b10; // out of bounds
				2'b01 : color_selector = 2'b00; // first image
				2'b10 : color_selector = 2'b01; // second image
				default : color_selector = 2'b10;
			
			endcase
			
			
		assign address1 = (h_count + 480 * v_count);
		assign address2 = (h_count + 480 * v_count);
		
		
endmodule 