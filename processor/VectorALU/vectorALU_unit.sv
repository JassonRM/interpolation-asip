module vectorALU_unit(input logic VCSub,
							input logic [2:0] ALUop,
							input logic [31:0] inputA, inputB,
							output logic [31:0] out);
							

logic neg;
logic [31:0] bilinear;
assign bilinear = (inputA * 2 + inputB) / 3;
assign neg = sub[31];

always_comb
	if(VCSub & neg) out <= inputA;
	else
		case (ALUop)
			3'b000: out <= inputA;
			3'b100: out <= bilinear;
			default: out <= 32'b0;
		endcase
endmodule