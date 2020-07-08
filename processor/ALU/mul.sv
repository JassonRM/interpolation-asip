module mul(input logic [31:0] OpA, OpB,
				output logic [31:0] result);
				
				assign result = OpA[15:0]*OpB[15:0];
				
endmodule
