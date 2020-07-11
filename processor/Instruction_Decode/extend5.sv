module extend5 (input logic [26:0]Address,
					 output logic [31:0] valueExtended);
					 
					 assign valueExtended = {5'b0,Address};

endmodule