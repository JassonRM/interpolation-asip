module mux2Decode (input logic sel,
				 input logic [4:0] Rs2,
				 output logic [4:0] Rs);
				always_comb
				begin
					case(sel)
						0 : Rs = Rs2;
						1 : Rs = 'b0;
					endcase
				end
endmodule
