module vectorial_registers (input logic WriteEn,clk,
					          input logic [4:0] Rs1, Rs2,rd,
								 input logic [127:0]InputData,
								 output logic [127:0]Rout1, Rout2);
								 
								 logic [127:0] vectorial_reg[7:0];
								 
								 always_ff @(posedge clk) 
										if (WriteEn) vectorial_reg[rd] <= InputData;
								
								assign Rout1 = vectorial_reg[Rs1];
								assign Rout2 = vectorial_reg[Rs2];
								
									
									
endmodule
