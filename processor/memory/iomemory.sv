module iomemory(input logic clk, write_enable, gpu_clk, gpu_sel,
					input logic[31:0] address, data_input, gpu_address,
					input logic[63:0] vector_input,
					output logic[7:0] gpu_out,
					output logic[31:0] data_output,
					output logic[127:0] vector_output);

logic decrypted_we, ram_we;
logic[7:0] encrypted_gpu, decrypted_gpu;
logic[31:0] button_read, ram_read, ram_data, ram_address, encrypted_address, decrypted_address;

assign button_read = 0;
	
address_decoder AddrDecoder(write_enable, address, button_read, ram_read, data_input,
ram_we, decrypted_we, ram_address, encrypted_address, decrypted_address, ram_data, data_output);

ram RAM(ram_address, clk, ram_data, ram_we, ram_read);

rom_encrypted Encrypted(encrypted_address, gpu_address, clk, gpu_clk, vector_output, encrypted_gpu);

vram_decrypted Decrypted(vector_input, gpu_address, gpu_clk, decrypted_address, clk, decrypted_we, decrypted_gpu);

always_comb
	case (gpu_sel)
		0: gpu_out = encrypted_gpu;
		1: gpu_out = decrypted_gpu;
	endcase

endmodule