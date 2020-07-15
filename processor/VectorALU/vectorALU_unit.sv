module vectorALU_unit(input logic VCSub,
							input logic [2:0] ALUop,
							input logic [31:0] inputA, inputB,
							output logic [31:0] out);
							

logic neg;
logic [31:0] mul, add, sub, shift;
assign mul = inputA[15:0] * inputB[15:0];
assign add = inputA + inputB;
assign sub = inputA - inputB; 
assign shift = inputA >> inputB;
assign neg = sub[31];

always_comb
	if(VCSub & neg) out <= inputA;
	else
		case (ALUop)
			3'b000: out <= inputA;
			3'b011: out <= add;
			3'b010: out <= mul;
			3'b001: out <= sub;
			3'b111: out <= shift;
			default: out <= 32'b0;
		endcase
endmodule