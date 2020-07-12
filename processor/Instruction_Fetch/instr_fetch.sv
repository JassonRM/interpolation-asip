module instr_fetch(input logic clk, rst,
					    input logic [1:0]NextInstrSel,
						 input logic [31:0] address, Rs, Branch,
						 
						 output logic [31:0]instr,
						 //output logic [4:0] OPcode,
						 //output logic [2:0] ALUop,
						 //output logic [4:0] Rs1,Rs2,Rd,
						 //output logic [15:0] Imm,
						 //output logic [26:0] Address
						 output logic [31:0]Instruction);
						 
	
	logic [31:0]pcPlus4,pc,nextPC;
	
	
	initial begin
		pc = 0;
		pcPlus4 = 0;
	end
	mux_fetch muxF (NextInstrSel, pcPlus4, address, Rs, Branch, nextPC);
	
	syncRegister PC_REG (clk, rst, nextPC, pc);
	
	add4 pcP4 (pc,pcPlus4);
	
	instruction_mem Instr (pc, instr);
	
	syncRegister fetch_reg (clk, rst, instr, Instruction);
	
	//Fetch_Reg fetch_reg (clk, rst, instr, OPcode,ALUop,Rs1,Rs2,Rd,Imm,Address);
	
	
endmodule
