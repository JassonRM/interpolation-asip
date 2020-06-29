module add (input logic [31:0] OpA, OpB,
				input logic Cin,
				output logic Cout,
				output logic [31:0]Result);
				
				assign {Cout, Result} = OpA + OpB + Cin;

endmodule
