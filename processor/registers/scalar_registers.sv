module scalar_registers (input logic WriteEn,clk,
					          input logic [4:0] Rs1, Rs2, rd,
								 input logic [31:0]InputData,
								 output logic [31:0]Rout1, Rout2);
								 
								 logic [31:0] scalar_reg[14:0];
								 
								 always_ff @(posedge clk)
									if (WriteEn)
										scalar_reg[rd] <= InputData;
										
								 assign Rout1 = (Rs1 == 5'b00000) ? 32'b0 : scalar_reg[Rs1];
								 assign Rout2 = (Rs2 == 5'b00000) ? 32'b0 : scalar_reg[Rs2]; 
endmodule
