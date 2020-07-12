module instr_fetch(input logic clk, rst, stall,
					    input logic [1:0]NextInstrSel,
						 input logic [31:0] address, Rs, Branch,
						 
						 output logic [31:0] PC);
						 //output logic [4:0] OPcode,
						 //output logic [2:0] ALUop,
						 //output logic [4:0] Rs1,Rs2,Rd,
						 //output logic [15:0] Imm,
						 //output logic [26:0] Address);
						 
	
	logic[31:0] pcPlus4, nextPC;
	
	mux_fetch muxF (NextInstrSel, pcPlus4, address, Rs, Branch, nextPC);
	
	syncRegister PC_REG (clk, rst, stall, nextPC, PC);
	
	add4 pcP4 (PC, pcPlus4);
	
endmodule
