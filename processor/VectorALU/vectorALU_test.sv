module vectorALU_test();

logic [2:0] ALUop;
logic [255:0] inputA, inputB, out;
logic VCSub;

vectorALU DUT(VCSub, ALUop, inputA, inputB, out);

initial begin
	VCSub = 0;
	inputA[31:0] = 32'd100;
	inputA[63:32] = 32'd101;
	inputA[95:64] = 32'd102;
	inputA[127:96] = 32'd103;
	inputA[159:128] = 32'd104;
	inputA[191:160] = 32'd105;
	inputA[223:192] = 32'd106;
	inputA[255:224] = 32'd107;
	
	inputB[31:0] = 32'd103;
	inputB[63:32] = 32'd103;
	inputB[95:64] = 32'd103;
	inputB[127:96] = 32'd103;
	inputB[159:128] = 32'd103;
	inputB[191:160] = 32'd103;
	inputB[223:192] = 32'd103;
	inputB[255:224] = 32'd103;
	
	ALUop = 3'b010; #10;
	assert(out[31:0] === 32'd10300) else $error("Mul 1 failed");
	assert(out[63:32] === 32'd10403) else $error("Mul 2 failed");
	assert(out[95:64] === 32'd10506) else $error("Mul 3 failed");
	assert(out[127:96] === 32'd10609) else $error("Mul 4 failed");
	assert(out[159:128] === 32'd10712) else $error("Mul 5 failed");
	assert(out[191:160] === 32'd10815) else $error("Mul 6 failed");
	assert(out[223:192] === 32'd10918) else $error("Mul 7 failed");
	assert(out[255:224] === 32'd11021) else $error("Mul 8 failed");
	
	ALUop = 3'b001; #10;
	assert(out[31:0] === -32'd3) else $error("Sub 1 failed");
	assert(out[63:32] === -32'd2) else $error("Sub 2 failed");
	assert(out[95:64] === -32'd1) else $error("Sub 3 failed");
	assert(out[127:96] === 32'd0) else $error("Sub 4 failed");
	assert(out[159:128] === 32'd1) else $error("Sub 5 failed");
	assert(out[191:160] === 32'd2) else $error("Sub 6 failed");
	assert(out[223:192] === 32'd3) else $error("Sub 7 failed");
	assert(out[255:224] === 32'd4) else $error("Sub 8 failed");
	
	VCSub = 1; #10;
	assert(out[31:0] === 32'd100) else $error("Sub Cond 1 failed");
	assert(out[63:32] === 32'd101) else $error("Sub Cond 2 failed");
	assert(out[95:64] === 32'd102) else $error("Sub Cond 3 failed");
	assert(out[127:96] === 32'd0) else $error("Sub Cond 4 failed");
	assert(out[159:128] === 32'd1) else $error("Sub Cond 5 failed");
	assert(out[191:160] === 32'd2) else $error("Sub Cond 6 failed");
	assert(out[223:192] === 32'd3) else $error("Sub Cond 7 failed");
	assert(out[255:224] === 32'd4) else $error("Sub Cond 8 failed");

	
	#10;
end
endmodule