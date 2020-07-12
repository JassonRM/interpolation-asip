module mide_cpu(input logic clk, rst, init_button, image_select,
					output logic vsync, hsync,
					output logic[24:0] RGB);

PC_deco PCdeco(BranchSel_EX, Zero, Carry, OverFlow, Negative, eq, bgt, JMPSel, NextInstrSel);

instr_fetch IF (clk, rst, stall, NextInstrSel, address_ID, Rs, Branch, PC);

// PC es el address que va a la memoria y genera instruction_IF

logic [31:0] instruction_ID; 

syncRegister #(32) IF_ID_REG(clk, rst, stall, instruction_IF, instruction_ID);

logic [4:0] Rd_ID, Rs1_ID, Rs2_ID;
assign Rd_ID = instruction_ID[26:22];
assign Rs1_ID = instruction_ID[21:17];
assign Rs2_ID = instruction_ID[16:12];

instr_decode ID (clk, rst, WriteRegister_WB, WriteRegisterVec_WB, Rd_WB, data_WB, instruction_ID, JMPSel, WriteRegister_ID, MemWrite_ID, RegWrite_ID, VCSub_ID, ALUop_ID, SelectorOpB_ID, BranchSel_ID, SelectorOpA_ID, SelWriteData_ID, WriteRegisterVec_ID, OpA_ID, OpB_ID, Imm_ID, OpAV_ID, OpBV_ID, address_ID);

logic [4:0] Rs1_EX, Rs2_EX;

syncRegister #(638) ID_EX_REG(clk, rst, stall, {Rd_ID, Rs1_ID, Rs2_ID, WriteRegister_ID, MemWrite_ID, RegWrite_ID, VCSub_ID, ALUop_ID, SelectorOpB_ID, BranchSel_ID, SelectorOpA_ID, SelWriteData_ID, WriteRegisterVec_ID, OpA_ID, OpB_ID, Imm_ID, OpAV_ID, OpBV_ID},
																{Rd_EX, Rs1_EX, Rs2_EX, WriteRegister_EX, MemWrite_EX, RegWrite_EX, VCSub_EX, ALUop_EX, SelectorOpB_EX, BranchSel_EX, SelectorOpA_EX, SelWriteData_EX, WriteRegisterVec_EX, OpA_EX, OpB_EX, Imm_EX, OpAV_EX, OpBV_EX});

execute EXE(VCSub_EX, SelWriteData_EX, Rs1_EX[4], Rs2_EX[4], OpAForward, OpBForward, SelectorOpA_EX, SelectorOpB_EX, ALUop_EX, OpA_EX, OpB_EX, Imm_EX, forwarded, OpAV_EX, OpBV_EX, forwardedV, Zero, Carry, OverFlow, Negative, eq, bgt, ALUresult_EX, WriteData_EX, VALUresult_EX);

logic ex_mem_rst;
assign ex_mem_rst = rst | stall;

logic [255:0] VALUresult_MEM;

syncRegister #(329) EX_MEM_REG(clk, ex_mem_rst, '0, {Rd_EX, WriteRegister_EX, MemWrite_EX, RegWrite_EX, WriteRegisterVec_EX, ALUresult_EX, WriteData_EX, VALUresult_EX}, 
															{Rd_MEM, WriteRegister_MEM, MemWrite_MEM, RegWrite_MEM, WriteRegisterVec_MEM, ALUresult_MEM, WriteData_MEM, VALUresult_MEM});

logic [63:0] vector_input;
assign vector_input = {VALUresult_MEM[231:224], VALUresult_MEM[199:192], VALUresult_MEM[167:160], VALUresult_MEM[135:128], VALUresult_MEM[103:96], VALUresult_MEM[71:64], VALUresult_MEM[39:32], VALUresult_MEM[7:0]};
															
logic [127:0] ReadMem_WB;							

syncRegister #(392) MEM_WB_REG(clk, rst, '0, {Rd_MEM, WriteRegister_MEM, RegWrite_MEM, WriteRegisterVec_MEM, ReadMem_MEM, result_MEM}, 
															{Rd_WB, WriteRegister_WB, RegWrite_WB, WriteRegisterVec_WB, ReadMem_WB, result_WB});

always_comb
	if(RegWrite_WB)
		data_WB = result_WB;
	else if(WriteRegister_WB)
		data_WB = {223'b0, ReadMem_WB[31:0]};
	else if(WriteRegisterVec_WB)
		data_WB = {16'b0, ReadMem_WB[127:112], 16'b0, ReadMem_WB[111:96], 16'b0, ReadMem_WB[95:80], 16'b0, ReadMem_WB[79:64], 16'b0, ReadMem_WB[63:48], 16'b0, ReadMem_WB[47:32], 16'b0, ReadMem_WB[31:16], 16'b0, ReadMem_WB[15:0]};
	else
		data_WB = 'b0;

logic write_enable_MEM, write_enable_WB;
assign write_enable_MEM = WriteRegister_MEM | WriteRegisterVec_MEM;
assign write_enable_WB = WriteRegister_WB | WriteRegisterVec_WB;


forwarding_unit DUT(RegWrite_MEM, write_enable_MEM, write_enable_WB, Rs1_EX, Rs2_EX, Rd_MEM, Rd_WB, result_MEM, result_WB, stall, OpAForward, OpBForward, forwarded, forwardedV);

endmodule