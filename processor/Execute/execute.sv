module execute(input logic VCSub, SelWriteData, Rs1_sel, Rs2_sel, OpAForward, OpBForward,
					input logic[1:0] SelectorOpA, SelectorOpB,
					input logic[2:0] ALUop,
					input logic[31:0] OpA, OpB, Imm, forwarded1, forwarded2,
					input logic[127:0] OpAV, OpBV, forwardedV1, forwardedV2,
					output logic Zero, Carry, OverFlow, Negative, eq, bgt,
					output logic[31:0] ALUresult, WriteData,
					output logic[127:0] VALUresult);

logic Cout;
logic[31:0] RegisterInputA, RegisterInputB, ALUinputA, ALUinputB;
logic[127:0] RegisterInputAV, RegisterInputBV, VALUinputA, VALUinputB;
					

escalar_ALU escalarALU(0, ALUop, ALUinputA, ALUinputB, Cout, ALUresult, Zero, Carry, OverFlow, Negative, eq, bgt);

vectorALU vectorALU(VCSub, ALUop, VALUinputA, VALUinputB, VALUresult);

always_comb
	begin
		case(OpAForward)
			0: begin RegisterInputA = OpA; RegisterInputAV = OpAV; end
			1: begin RegisterInputA = forwarded1; RegisterInputAV = forwardedV1; end
		endcase
		
		case(OpBForward)
			0: begin RegisterInputB = OpB; RegisterInputBV = OpBV; end
			1: begin RegisterInputB = forwarded2; RegisterInputBV = forwardedV2; end
		endcase
	
		case(SelectorOpA)
			0: ALUinputA = RegisterInputA;
			1: ALUinputA = {16'b0, RegisterInputA[15:0]};
			default: ALUinputA = 'b0;
		endcase
		
		case(SelectorOpB)
			0: ALUinputB = RegisterInputB;
			1: ALUinputB = Imm;
			default: ALUinputB = 'b0;
		endcase
		
		case(Rs1_sel)
			0: VALUinputA = {4{RegisterInputA}};
			1: VALUinputA = RegisterInputAV;
		endcase
		
		case(Rs2_sel)
			0: VALUinputB = {4{RegisterInputB}};
			1: VALUinputB = RegisterInputBV;
		endcase
	
		case(SelWriteData)
			0: WriteData = RegisterInputA;
			1: WriteData = {16'b0, RegisterInputB[15:0]};
		endcase
	end
endmodule
