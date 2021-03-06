module mide_cpu(input logic clk, gpu_clk, rst, start_button, image_select, interpolation_type,
					input logic [3:0] quadrant,
					input logic [31:0] gpu_address,
					output logic[7:0] vram_out);

logic Zero, Carry, OverFlow, Negative, eq, bgt, stall, WriteRegister_WB, WriteRegisterVec_WB, WriteRegister_ID, MemWrite_ID, RegWrite_ID, VCSub_ID, SelWriteData_ID, WriteRegisterVec_ID, SelWriteData_EX, WriteRegisterVec_EX, 
		WriteRegister_EX, MemWrite_EX, RegWrite_EX, VCSub_EX, OpAForward, OpBForward, WriteRegister_MEM, MemWrite_MEM, RegWrite_MEM, WriteRegisterVec_MEM, RegWrite_WB; 
logic [1:0] BranchSel, JMPSel, NextInstrSel, SelectorOpB_ID, BranchSel_ID, SelectorOpA_ID, SelectorOpB_EX, BranchSel_EX, SelectorOpA_EX;
logic [2:0] ALUop_ID, ALUop_EX;
logic [4:0] Rd_WB, Rd_EX, Rs1_EX, Rs2_EX, Rd_MEM;
logic [7:0] encrypted_gpu, decrypted_gpu;
logic [31:0] address_ID, PC, instruction_IF, instruction_ID, OpA_ID, OpB_ID, Imm_ID, OpA_EX, OpB_EX, Imm_EX, forwarded1, forwarded2, ALUresult_EX, WriteData_EX, ALUresult_MEM, WriteData_MEM, ReadMem_MEM, ReadMem_WB;
logic [31:0] vector_input;
logic [31:0] ReadMemV_MEM, ReadMemV_WB;
logic [127:0] data_WB, OpAV_ID, OpBV_ID, OpAV_EX, OpBV_EX, forwardedV1, forwardedV2, VALUresult_EX, VALUresult_MEM, result_MEM, result_WB; 
					
PC_deco PCdeco(BranchSel_EX, eq, bgt, JMPSel, NextInstrSel);

instr_fetch IF (clk, rst, stall, NextInstrSel, address_ID, OpA_ID, Imm_EX, PC);

syncRegister #(32) IF_ID_REG(clk, rst, stall, instruction_IF, instruction_ID);

logic [4:0] Rd_ID, Rs1_ID, Rs2_ID;
assign Rd_ID = instruction_ID[26:22];


 
instr_decode ID (clk, rst, WriteRegister_WB, WriteRegisterVec_WB, Rd_WB, data_WB, instruction_ID, JMPSel, WriteRegister_ID, MemWrite_ID, RegWrite_ID, VCSub_ID, ALUop_ID, SelectorOpB_ID, BranchSel_ID, SelectorOpA_ID, SelWriteData_ID, WriteRegisterVec_ID, OpA_ID, OpB_ID, Imm_ID, OpAV_ID, OpBV_ID, address_ID, Rs1_ID, Rs2_ID);

syncRegister #(382) ID_EX_REG(clk, rst, stall, {Rd_ID, Rs1_ID, Rs2_ID, WriteRegister_ID, MemWrite_ID, RegWrite_ID, VCSub_ID, ALUop_ID, SelectorOpB_ID, BranchSel_ID, SelectorOpA_ID, SelWriteData_ID, WriteRegisterVec_ID, OpA_ID, OpB_ID, Imm_ID, OpAV_ID, OpBV_ID},
																{Rd_EX, Rs1_EX, Rs2_EX, WriteRegister_EX, MemWrite_EX, RegWrite_EX, VCSub_EX, ALUop_EX, SelectorOpB_EX, BranchSel_EX, SelectorOpA_EX, SelWriteData_EX, WriteRegisterVec_EX, OpA_EX, OpB_EX, Imm_EX, OpAV_EX, OpBV_EX});

execute EXE(VCSub_EX, SelWriteData_EX, Rs1_EX[4], Rs2_EX[4], OpAForward, OpBForward, SelectorOpA_EX, SelectorOpB_EX, ALUop_EX, OpA_EX, OpB_EX, Imm_EX, forwarded1, forwarded2, OpAV_EX, OpBV_EX, forwardedV1, forwardedV2, Zero, Carry, OverFlow, Negative, eq, bgt, ALUresult_EX, WriteData_EX, VALUresult_EX);

logic ex_mem_rst;
assign ex_mem_rst = rst | stall;

syncRegister #(201) EX_MEM_REG(clk, ex_mem_rst, '0, {Rd_EX, WriteRegister_EX, MemWrite_EX, RegWrite_EX, WriteRegisterVec_EX, ALUresult_EX, WriteData_EX, VALUresult_EX}, 
															{Rd_MEM, WriteRegister_MEM, MemWrite_MEM, RegWrite_MEM, WriteRegisterVec_MEM, ALUresult_MEM, WriteData_MEM, VALUresult_MEM});


assign vector_input = {VALUresult_MEM[103:96], VALUresult_MEM[71:64], VALUresult_MEM[39:32], VALUresult_MEM[7:0]};
															
					
//          1     1       1     1             1            1              1                      1            1   1               1              1             1               1            1              1               1     1      1
//memory MEM(clk, gpu_clk, !rst, start_button, image_select, MemWrite_MEM, WriteRegisterVec_MEM, ALUresult_MEM, PC, WriteData_MEM, ALUresult_MEM, vector_input, VALUresult_MEM, ReadMem_MEM, instruction_IF, ReadMemV_MEM, hsync, vsync, rgb_out, result_MEM);



		

memory MEM(clk, gpu_clk, !rst, start_button, image_select, MemWrite_MEM, WriteRegisterVec_MEM, interpolation_type, quadrant, ALUresult_MEM, PC, WriteData_MEM, ALUresult_MEM,vector_input,encrypted_gpu, decrypted_gpu, VALUresult_MEM,gpu_address, ReadMem_MEM, instruction_IF, ReadMemV_MEM, result_MEM);

always_comb
		case(image_select)
			1'b0 : vram_out <= encrypted_gpu;
			1'b1 : vram_out <= decrypted_gpu;
		endcase
		
					

syncRegister #(200) MEM_WB_REG(clk, rst, '0, {Rd_MEM, WriteRegister_MEM, RegWrite_MEM, WriteRegisterVec_MEM, ReadMem_MEM, ReadMemV_MEM, result_MEM}, 
															{Rd_WB, WriteRegister_WB, RegWrite_WB, WriteRegisterVec_WB, ReadMem_WB, ReadMemV_WB, result_WB});

always_comb
	if(RegWrite_WB)
		data_WB = result_WB;
	else if(WriteRegister_WB)
		data_WB = {95'b0, ReadMem_WB};
	else if(WriteRegisterVec_WB)
		data_WB = {24'b0, ReadMemV_WB[31:24], 24'b0, ReadMemV_WB[23:16], 24'b0, ReadMemV_WB[15:8], 24'b0, ReadMemV_WB[7:0]};
	else
		data_WB = 'b0;

logic write_enable_MEM, write_enable_WB;
assign write_enable_MEM = WriteRegister_MEM | WriteRegisterVec_MEM;
assign write_enable_WB = WriteRegister_WB | WriteRegisterVec_WB;


forwarding_unit Forwarding_unit(RegWrite_MEM, write_enable_MEM, write_enable_WB, Rs1_EX, Rs2_EX, Rd_MEM, Rd_WB, result_MEM, data_WB, stall, OpAForward, OpBForward, forwarded1, forwarded2, forwardedV1, forwardedV2);

endmodule