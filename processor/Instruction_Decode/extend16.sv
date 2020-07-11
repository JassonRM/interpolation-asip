module extend16 (input logic [15:0] register,
					output logic [31:0] valueExtended);
					
					assign valueExtended = {16'b0,register};

endmodule
