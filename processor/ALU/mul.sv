module mul(input logic [15:0] OpA, OpB,
				output logic [31:0] result);
				
				assign result = OpA*OpB;
				
endmodule
