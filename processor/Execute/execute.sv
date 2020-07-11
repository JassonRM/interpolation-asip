module execute(input logic VCSub, SelWriteData, Rs1_sel, Rs2_sel,
					input logic[1:0] SelectorOpA, SelectorOpB,
					input logic[2:0] ALUop,
					input logic[31:0] OpA, OpB, Imm,
					input logic[255:0] OpAV, OpBV,
					output logic Zero, Carry, OverFlow, Negative, eq, bgt,
					output logic[31:0] ALUresult, WriteData,
					output logic[255:0] VALUresult);

logic Cout;
logic[31:0] ALUinputA, ALUinputB;
logic[255:0] VALUinputA, VALUinputB;
					

escalar_ALU escalarALU(0, ALUop, ALUinputA, ALUinputB, Cout, ALUresult, Zero, Carry, OverFlow, Negative, eq, bgt);

vectorALU vectorALU(VCSub, ALUop, VALUinputA, VALUinputB, VALUresult);

always_comb
	begin
		case(SelectorOpA)
			0: ALUinputA = OpA;
			1: ALUinputA = {16'b0, OpA[15:0]};
			default: ALUinputA = 'b0;
		endcase
		
		case(SelectorOpB)
			0: ALUinputB = OpB;
			1: ALUinputB = Imm;
			default: ALUinputB = 'b0;
		endcase
		
		case(Rs1_sel)
			0: VALUinputA = {8{OpA}};
			1: VALUinputA = OpAV;
		endcase
		
		case(Rs2_sel)
			0: VALUinputB = {8{OpB}};
			1: VALUinputB = OpBV;
		endcase
	
		case(SelWriteData)
			0: WriteData = OpA;
			1: WriteData = {16'b0, OpB[15:0]};
		endcase
	end
endmodule
