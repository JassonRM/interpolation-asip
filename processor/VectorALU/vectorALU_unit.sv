module vectorALU_unit(input logic VCSub,
							input logic [2:0] ALUop,
							input logic [31:0] inputA, inputB,
							output logic [31:0] out);
							

logic [31:0] bilinear;
assign bilinear = (inputA * 2 + inputB) / 3;

always_comb
	if(VCSub) out <= inputA;
	else
		case (ALUop)
			3'b000: out <= inputA;
			3'b100: out <= bilinear;
			default: out <= 32'b0;
		endcase
endmodule