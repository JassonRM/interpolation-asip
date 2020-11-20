module vectorALU_test();

logic [2:0] ALUop;
logic [127:0] inputA, inputB, out;
logic VCSub;

vectorALU DUT(VCSub, ALUop, inputA, inputB, out);

initial begin
	VCSub = 0;
	inputA[31:0] = 32'd100;
	inputA[63:32] = 32'd101;
	inputA[95:64] = 32'd102;
	inputA[127:96] = 32'd103;
	
	inputB[31:0] = 32'd103;
	inputB[63:32] = 32'd103;
	inputB[95:64] = 32'd103;
	inputB[127:96] = 32'd103;

	
	ALUop = 3'b010; #10;
	assert(out[31:0] === 32'd10300) else $error("Mul 1 failed");
	assert(out[63:32] === 32'd10403) else $error("Mul 2 failed");
	assert(out[95:64] === 32'd10506) else $error("Mul 3 failed");
	assert(out[127:96] === 32'd10609) else $error("Mul 4 failed");

	
	ALUop = 3'b001; #10;
	assert(out[31:0] === -32'd3) else $error("Sub 1 failed");
	assert(out[63:32] === -32'd2) else $error("Sub 2 failed");
	assert(out[95:64] === -32'd1) else $error("Sub 3 failed");
	assert(out[127:96] === 32'd0) else $error("Sub 4 failed");

	VCSub = 1; #10;
	assert(out[31:0] === 32'd100) else $error("Sub Cond 1 failed");
	assert(out[63:32] === 32'd101) else $error("Sub Cond 2 failed");
	assert(out[95:64] === 32'd102) else $error("Sub Cond 3 failed");
	assert(out[127:96] === 32'd0) else $error("Sub Cond 4 failed");
	
	
	VCSub = 0; 
	ALUop = 3'b100; #10;
	assert(out[31:0] === 32'd100) else $error("NNI 1 failed");
	assert(out[63:32] === 32'd100) else $error("NNI 2 failed");
	assert(out[95:64] === 32'd101) else $error("NNI 3 failed");
	assert(out[127:96] === 32'd101) else $error("NNI 4 failed");
	
	VCSub = 0; 
	ALUop = 3'b110; #10;
	assert(out[31:0] === 32'd100) else $error("BIH 1 failed");
	assert(out[63:32] === 32'd100) else $error("BIH 2 failed");
	assert(out[95:64] === 32'd100) else $error("BIH 3 failed");
	assert(out[127:96] === 32'd101) else $error("BIH 4 failed");

	
	#10;
end
endmodule