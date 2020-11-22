module iomemory(input logic clk, write_enable, gpu_clk, button_start, interpolation_type,
					input logic[3:0] quadrant,
					input logic[31:0] data_address, address_intr, data_input, gpu_address,
					input logic[31:0] vector_input,
					output logic[7:0] encrypted_gpu, decrypted_gpu,
					output logic[31:0] data_output, intr_output,
					output logic[31:0] vector_output);

logic decrypted_we, ram_we;
logic[31:0] button_read, interpolation_read, quadrant_read, ram_read, ram_data, ram_address, encrypted_address, decrypted_address;

assign button_read = {31'd0, button_start}; // extender a 32
assign interpolation_read = {31'd0, interpolation_type};
assign quadrant_read = {28'd0, quadrant};
	
address_decoder AddrDecoder(write_enable, data_address, button_read, interpolation_read, quadrant_read, ram_read, data_input,
ram_we, decrypted_we, ram_address, encrypted_address, decrypted_address, ram_data, data_output);

logic[31:0] address_intr_2;

assign address_intr_2 = address_intr / 4;

ram RAM(ram_address, address_intr_2, clk, ram_data, 'd0, ram_we, 1'b0, ram_read, intr_output);

rom full_image(encrypted_address, gpu_address, clk, gpu_clk, vector_output, encrypted_gpu);

vram zoomed_image(vector_input, gpu_address, gpu_clk, decrypted_address, clk, decrypted_we, decrypted_gpu);

endmodule 