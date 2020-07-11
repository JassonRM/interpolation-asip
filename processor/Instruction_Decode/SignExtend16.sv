module SignExtend16 (input logic [15:0] imm,
						 output logic [31:0] valueExtend);
						 
						 assign valueExtend = {{16{imm[15]}},imm};

endmodule
