module sub (input logic [31:0] OpA, OpB,
				output logic [31:0] Result);
				assign Result = OpA - OpB;
endmodule
