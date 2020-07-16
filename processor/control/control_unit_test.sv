`timescale 1 ps / 1 ps
module control_unit_test();
	
	logic [4:0] OPcode;
	logic [2:0] ALUop;
	logic [1:0] JMPSel;
	logic WriteRegister, MemWrite, RegWrite, vcsub, SelectorRs2, SelWriteData, WriteRegisterVec, SelectorRs1;
	logic [2:0] ALUOp;
	logic [1:0] SelectorOpB, BranchSel, SelectorOpA;

	
	Control_Unit DUT(OPcode, ALUop, JMPSel, WriteRegister, MemWrite, RegWrite, vcsub, ALUOp, 
							SelectorOpB, SelectorRs2, BranchSel, SelectorOpA, SelWriteData, WriteRegisterVec, SelectorRs1);

	initial begin
		
		OPcode = 5'b00000;
		ALUop = 3'b101;
		
		#10 OPcode = 5'b00000;
		#10 OPcode = 5'b01000;
		#10 OPcode = 5'b01001;
		#10 OPcode = 5'b00010;
		#10 OPcode = 5'b00011;
		#10 OPcode = 5'b00100;
		#10 OPcode = 5'b00101;
		#10 OPcode = 5'b10000;
		#10 OPcode = 5'b00110;
		#10 OPcode = 5'b10001;
		#10 OPcode = 5'b01010;
		#10 OPcode = 5'b01011;
		#10 OPcode = 5'b01011;
		
		#10 OPcode = 5'b11000;
		#10 OPcode = 5'b11110;
		#10 OPcode = 5'b11011;
		#10 OPcode = 5'b11101;
		
	end
	
	
endmodule 