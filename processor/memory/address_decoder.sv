module address_decoder #(parameter N=32)(input logic write_enable, 
													input logic[N-1:0] address, button_read, interpolation_read, quadrant_read, ram_read, data_input,
													output logic ram_we, decrypted_we,
													output logic[N-1:0] ram_address, encrypted_address, decrypted_address, ram_data, data_output);
													

always_comb
	case(write_enable)
	0:
		begin
			ram_we = 0;
			decrypted_we = 0;
			ram_data = 'z;
			if(address < 'h400)
				begin
					ram_address = address / 4;
					encrypted_address = 'z;
					decrypted_address = 'z;
					data_output = ram_read;
				end
			else if(address >= 'h400 && address < 'h404)
				begin
					ram_address = 'z;
					decrypted_address = 'z;
					encrypted_address = 'z;
					data_output = button_read;
				end
			else if(address >= 'h404 && address < 'h408)
				begin
					ram_address = 'z;
					decrypted_address = 'z;
					encrypted_address = 'z;
					data_output = interpolation_read;
				end
			else if(address >= 'h408 && address < 'h40C)
				begin
					ram_address = 'z;
					decrypted_address = 'z;
					encrypted_address = 'z;
					data_output = quadrant_read;
				end
			else if(address >= 'h20000 && address < 'h47100)
				begin
					ram_address = 'z;
					decrypted_address = 'z;
					encrypted_address = (address - 'h20000) / 4;
					data_output = 'z;
				end
			else
				begin
					ram_address = 'z;
					decrypted_address = 'z;
					encrypted_address = 'z;
					data_output = 'z;
				end
		end
	1:
		begin
			data_output = 'z;
			encrypted_address = 'z;
			if(address < 'h400)
				begin
					ram_address = address / 4;
					ram_data = data_input;
					ram_we = 1;
					decrypted_address = 'z;
					decrypted_we = 0;
				end
			else if(address >= 'h40C && address < 'h1940C)
				begin
					ram_address = 'z;
					ram_data = 'z;
					ram_we = 0;
					decrypted_address = (address - 'h40C) / 4;
					decrypted_we = 1;
				end
			else
				begin
					ram_address = 'z;
					ram_data = 'z;
					ram_we = 0;
					decrypted_address = 'z;
					decrypted_we = 0;
				end
		end
	endcase
endmodule