module vectorALU(input logic VCSub,
						input logic [2:0] ALUop,
						input logic [127:0] inputA, inputB,
						output logic [127:0] out);

logic [2:0] unitOp;
logic [31:0] inputB1, out1, out2, out3, out4;

vectorALU_unit unit1(VCSub, unitOp, inputA[31:0], inputB[31:0], out1),
					unit2(VCSub, unitOp, inputA[63:32], inputB[63:32], out2),
					unit3(VCSub, unitOp, inputA[95:64], inputB[95:64], out3),
					unit4(VCSub, unitOp, inputA[127:96], inputB[127:96], out4);
					
assign inputB1 = inputB[31:0];

always_comb
	case (ALUop)
		3'b001:
			begin
				unitOp <= 3'b000;
				out[31:0] <= out1;
				out[63:32] <= out1;
				out[95:64] <= out2;
				out[127:96] <= out2;
			end
		3'b010:
			begin
				unitOp <= 3'b000;
				out[31:0] <= out3;
				out[63:32] <= out3;
				out[95:64] <= out4;
				out[127:96] <= out4;
			end
		3'b101:
			begin
				unitOp <= 3'b000;
				out[31:0] <= out1;
				out[63:32] <= (out1 * 2 + out2) / 3;
				out[95:64] <= (out2 * 2 + out1) / 3;
				out[127:96] <= out2;
			end
		3'b110:
			begin
				unitOp <= 3'b000;
				out[31:0] <= (out2 * 2 + out3) / 3;
				out[63:32] <= (out3 * 2 + out2) / 3;
				out[95:64] <= out3;
				out[127:96] <= (out3 * 2 + out4) / 3;
			end
		3'b111:
			begin
				unitOp <= 3'b000;
				out[31:0] <= (out4 * 2 + out3) / 3;
				out[63:32] <= out4;
				out[95:64] <= (out4 * 2 + inputB1) / 3;
				out[127:96] <= (inputB1 * 2 + out4) / 3;
			end
		default:
			begin
				unitOp <= ALUop;
				out[31:0] <= out1;
				out[63:32] <= out2;
				out[95:64] <= out3;
				out[127:96] <= out4;
			end
	endcase
endmodule
