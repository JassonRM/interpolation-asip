module mux_fetch (input logic [1:0]NextInstrSel,
						input logic [31:0] PCplus4,Address, Rs, Branch,
						output logic [31:0]nextPC); // NextInstrSel comes from PC_deco.
						always @(*) begin
							case(NextInstrSel)
								2'b00 : nextPC <= PCplus4;
								2'b01 : nextPC <= Address;
								2'b10 : nextPC <= Rs;
								2'b11 : nextPC <= Branch;
							endcase
						
						end

endmodule
