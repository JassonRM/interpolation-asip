module mux2Decode (input logic sel,
				 input logic [4:0] Rs2,
				 output logic [4:0] Rs);
				always@(*) begin
					case(sel)
						1'b0 : Rs <= Rs2;
						1'b1 : Rs <= 5'b0;
					endcase
				end
endmodule
