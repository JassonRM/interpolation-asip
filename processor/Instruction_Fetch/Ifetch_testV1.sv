module Ifetch_testV1;
logic clk,rst;
logic [1:0]NextInstrSel;
logic [31:0] address, Rs, Branch;
logic [31:0] instr;
logic [4:0] OPcode;
logic [2:0] ALUop;
logic [4:0] Rs1,Rs2,Rd;
logic [15:0] Imm;
logic [26:0] Address;


instr_fetch IF (clk, rst, NextInstrSel, address, Rs, Branch, instr, OPcode, ALUop, Rs1, Rs2, Rd, Imm, Address);

	initial begin
		
		clk = 0;
		rst = 0;
		NextInstrSel = 0;
		address = 0;
		Rs = 0;
		Branch = 0;
		
	end 
	
always
		#10 clk <= !clk;
		
endmodule
