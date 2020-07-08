module vectorALU_unit_test();

logic [2:0] ALUop;
logic [31:0] inputA, inputB, out;
logic VCSub;

vectorALU_unit DUT(VCSub, ALUop, inputA, inputB, out);

initial begin
	VCSub = 0;
	inputA = 32'd1250;
	inputB = 32'd342;
	ALUop = 3'b010; #10;
	assert(out === 32'd427500) else $error("Mul 1 failed");
	
	ALUop = 3'b001; #10;
	assert(out === 32'd908) else $error("Sub failed");
	
	VCSub = 1; #10;
	assert(out === 32'd908) else $error("Sub Cond 1 failed");
	
	inputA = 32'd100;
	inputB = 32'd342; #10;
	assert(out === 32'd100) else $error("Sub Cond 2 failed");
	
	inputA = 32'b00111000000000000000000000000000;
	inputB = 32'd23;
	ALUop = 3'b111; #10;
	assert(out === 32'b00000000000000000000000001110000) else $error("Shift 1 failed");
	
	#10;
end
endmodule