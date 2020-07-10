module Ifetch_testV1;
logic clk;
logic [31:0] pc,pcPlus4,instr;
logic [4:0] OPcode;
logic [2:0] ALUop;
logic [4:0] Rs1,Rs2,Rd;
logic [15:0] Imm;
logic [26:0] Address;

syncRegister PC_REG (clk, 1'b0, pcPlus4, pc);
add4 pcP4 (pc,pcPlus4);
instruction_mem Instr (pc, instr);
Fetch_Reg fetch_reg (clk, 1'b0, instr, OPcode,ALUop,Rs1,Rs2,Rd,Imm,Address);


	initial begin
		clk = 0;
		
		pc = 0;
		pcPlus4 = 0;	
	end 
	
always
		#10 clk <= !clk;
		
endmodule
