module vectorALU(input logic VCSub,
						input logic [2:0] ALUop,
						input logic [255:0] inputA, inputB,
						output logic [255:0] out);

vectorALU_unit unit1(VCSub, ALUop, inputA[31:0], inputB[31:0], out[31:0]),
					unit2(VCSub, ALUop, inputA[63:32], inputB[63:32], out[63:32]),
					unit3(VCSub, ALUop, inputA[95:64], inputB[95:64], out[95:64]),
					unit4(VCSub, ALUop, inputA[127:96], inputB[127:96], out[127:96]),
					unit5(VCSub, ALUop, inputA[159:128], inputB[159:128], out[159:128]),
					unit6(VCSub, ALUop, inputA[191:160], inputB[191:160], out[191:160]),
					unit7(VCSub, ALUop, inputA[223:192], inputB[223:192], out[223:192]),
					unit8(VCSub, ALUop, inputA[255:224], inputB[255:224], out[255:224]);
						
endmodule