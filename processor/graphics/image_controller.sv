module image_controller #(width1 = 480, height1 = 320, width2 = 480, height2 = 640)
							  (input logic clk, reset, hsync, vsync, visible, image_selector,
								output logic[1:0] color_selector,
								output logic[18:0] address);
		
		
		logic inbounds1, inbounds2, start_of_row;
		logic[10:0] h_count; 
		logic[9:0] v_count;
		
		always_ff @(posedge clk, negedge reset, negedge vsync)
		begin
			
			if (!reset || !vsync) 
			begin
				h_count = 0;
				v_count = 0;
				start_of_row = 0;
			end
			
			else
			begin
				if (start_of_row)
				begin
					if (!hsync)
					begin
						v_count = v_count + 10'd1;
						h_count = 0;
						start_of_row = 0;
					end
					else 
						h_count = h_count + 11'd1;
				end
				else if (visible)
					start_of_row = 1;
				else 
				begin
					h_count = h_count;
					v_count = v_count;
					start_of_row = start_of_row;
				end
			end
		
		end
		
		assign inbounds1 = h_count < width1 && v_count < height1;
		assign inbounds2 = h_count < width2 && v_count < height2;
		
		
		always_comb
		
			case ({inbounds2 && image_selector, inbounds1 && !image_selector})
			
				2'b01 : begin color_selector = 2'b00; address = (h_count + width1 * v_count); end// first image
				2'b10 : begin color_selector = 2'b01; address = (h_count + width2 * v_count); end// second image
				default : begin color_selector = 2'b10; address = 'd0; end
			
			endcase
		
		
endmodule 