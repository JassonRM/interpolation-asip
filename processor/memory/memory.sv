
module memory (input logic clk, gpu_clk, reset, button_start, image_select, write_enable, select_alu, interpolation_type,
					input logic[3:0] quadrant,
					input logic[31:0] data_address, instr_address, data_input, ALUresult,
					input logic[31:0] vector_input,
					output logic[7:0] encrypted_gpu, decrypted_gpu,
					input logic[127:0] VALUresult,
					input logic [31:0] gpu_address,
					output logic[31:0] data_output, instr_output,
					output logic[31:0] vector_output,
					output logic[127:0] ALUoutput);


	//graphics_controller DUT(clk, reset, write_enable, gpu_clk, image_select, button_start, 
	//								data_address, instr_address, data_input, vector_input, data_output, 
	//								instr_output, vector_output, hsync, vsync, rgb_out);
	
	iomemory mem(clk, write_enable, gpu_clk, button_start, data_address, instr_address, data_input, gpu_address, vector_input, encrypted_gpu, decrypted_gpu, data_output, instr_output, vector_output);

	always_comb
		case(select_alu)
			
			1'b0 : ALUoutput = {96'd0, ALUresult};
			1'b1 : ALUoutput = VALUresult;
			default : ALUoutput = VALUresult;
		
		endcase
endmodule 