module escalar_ALU (input logic Cin,
					     input logic [2:0]ALUop,
						  input logic [31:0] OpA, OpB,
						  output logic Cout,
						  output logic [31:0] Result,
						  output logic Zero, Carry, OverFlow, Negative, eq, bgt);
						  
						  logic [31:0]  resultAdd, resultSub, resultMul, resultSleft, resultAnd, resultSright; 
						  
						  add 	Add 		(OpA, OpB, Cin, Cout, resultAdd);
						  sub 	Sub 		(OpA, OpB, resultSub);
						  mul 	Mul 		(OpA, OpB, resultMul);
						  sLeft 	SLeft 	(OpA, OpB, resultSleft);
						  and_ 	And_		(OpA, OpB, resultAnd);
						  sRight SRight		(OpA, OpB, resultSright);
						  
						  mux_ALU main_mux (ALUop, resultAdd, resultSub, resultMul, resultSleft, resultAnd, resultSright, Result);
						  
						  assign Carry =  Cout & ~ALUop[1];
						  assign OverFlow = ~ALUop[1] & (resultAdd[31] ^ OpA[31]) & (OpA[31] ^ OpB[31] ^ ALUop[0]);
						  assign Negative = Result[31];
						  assign Zero = ~Result[31];
						  assign eq = (OpA == OpB);
						  assign bgt = (OpA > OpB);
endmodule
