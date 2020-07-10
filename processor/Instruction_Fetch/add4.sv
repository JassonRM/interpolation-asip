module add4 (input logic [31:0] pc,
				 output logic [31:0] pcPlus4);
		assign pcPlus4 = pc + 4;
endmodule