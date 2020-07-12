
module memory (input logic clk, gpu_clk, reset, button_start, image_select, write_enable, select_alu,
					input logic[31:0] data_address, instr_address, data_input, ALUresult,
					input logic[63:0] vector_input,
					input logic[255:0] VALUresult,
					output logic[31:0] data_output, instr_output,
					output logic[127:0] vector_output,
					output logic hsync, vsync,
					output logic[23:0] rgb_out,
					output logic[255:0] ALUoutput);


	graphics_controller DUT(clk, reset, write_enable, gpu_clk, image_select, button_start, 
									data_address, instr_address, data_input, vector_input, data_output, 
									instr_output, vector_output, hsync, vsync, rgb_out);

	always_comb
		case(select_alu)
			
			1'b0 : ALUoutput = {224'd0, ALUresult};
			1'b1 : ALUoutput = VALUresult;
			default : ALUoutput = VALUresult;
		
		endcase
	

endmodule 