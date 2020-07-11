module instr_decode(input logic clk, rst, WRITEREGISTER_WB,  // WRITEREGISTER is the same signal WriteRegister, but comes from WriteBack.
							input logic WRITEREGISTERVEC_WB, // WRITEREGISTERVEC is the signal that comes from WB.
							input logic [31:0] RD_WB, // RD is the same as rd but the first one comes from Write Back.
							input logic [255:0] INPUTDATA, // INPUTDATA is the same as InputData, but it comes from Write Back.
							input logic [31:0] instruction,
							output logic [1:0] JMPSel,
							output logic [31:0] Address,
							output logic WIRTEREGISTER,
							output logic MEMRITE,
							output logic [1:0] REGWRITE,VCSUB,
							output logic [2:0] ALUOP,
							output logic [1:0] SELECTOROPB,
							output logic SELECTORRS2,
							output logic [1:0] BRANCHSEL,
							output logic [1:0] SELECTOROPA,
							output logic SELWRITEDATA,
							output logic WRITEREGISTERVEC,
							output logic [31:0] RS1, RS2,
							output logic [4:0] INSTRRS1, INSTRRS2,
							output logic [255:0] VRS1, VRS2,
							output logic [31:0] EXTENDERRS1, EXTENDERRS2,
							output logic [4:0] RD);

logic [31:0] RSout1,RSout2;
logic [255:0] VSout1, VSout2;
logic Rs2;
logic [31:0] HalfLoadValue, HalfStoreValue;
logic [31:0]ImmSignExtended;
logic WriteRegister;
logic MemWrite;
logic [1:0]RegWrite;
logic [1:0] vcsub;
logic [2:0] ALUOp;
logic [1:0] SelectorOpB;
logic SelectorRs2;
logic [1:0] BranchSel;
logic [1:0]SelectorOpA;
logic SelWriteData;
logic WriteRegisterVec;

//						OPcode				ALUop
Control_Unit CU (instruction[31:27],instruction[11:9],JMPSel,WriteRegister,MemWrite,RegWrite,vcsub,ALUOp,SelectorOpB,SelectorRs2,BranchSel,SelectorOpA,SelWriteData,WriteRegisterVec);

mux2Decode M2D (SelectorRs2,instruction[16:12],Rs2);

//														  Rs1  								    // it has to be specified because INPUTDATA is 256 bus, and in this case we just use the last 32 bits.            
scalar_registers SR (WRITEREGISTER_WB, clk, instruction[21:17], Rs2, RD_WB, INPUTDATA[31:0],RSout1,RSout2);

//						 Imm
SignExtend16 SE16 (instruction[16:1],ImmSignExtended);

//															   Rs1                 Rs2
top_vectorial_reg VR (WRITEREGISTERVEC_WB, clk, instruction[21:17], instruction[16:12],RD_WB, INPUTDATA, VSout1, VSout2);

//										This signal goes backwards fetch.
extend5 E5 (instruction[26:0],Address);

extend16 E16HalfLoad (RSout1[15:0],HalfLoadValue);

extend16 E16HalfStore (RSout2[15:0], HalfStoreValue);
//																																																					 Rs1[4:0]            Rs2[4:0]																			 rd[4:0]					Outputs->													
Decode_Reg DR (clk, rst,WriteRegister,MemWrite,RegWrite,vcsub,ALUOp,SelectorOpB,SelectorRs2,BranchSel,SelectorOpA,SelWriteData,WriteRegisterVec, RSout1, RSout2,instruction[21:17], instruction[16:12],VSout1, VSout2,HalfLoadValue,HalfStoreValue, instruction[26:22], WIRTEREGISTER,MEMRITE,REGWRITE,VCSUB,ALUOP,SELECTOROPB,SELECTORRS2,BRANCHSEL,SELECTOROPA,SELWRITEDATA,WRITEREGISTERVEC,RS1, RS2,INSTRRS1, INSTRRS2,VRS1, VRS2,EXTENDERRS1, EXTENDERRS2,RD);



endmodule 

