module instr_decode(input logic clk, rst, WRITEREGISTER_WB,  // WRITEREGISTER is the same signal WriteRegister, but comes from WriteBack.
							input logic WRITEREGISTERVEC_WB, // WRITEREGISTERVEC is the signal that comes from WB.
							input logic [4:0] RD_WB, // RD is the same as rd but the first one comes from Write Back.
							input logic [255:0] INPUTDATA, // INPUTDATA is the same as InputData, but it comes from Write Back.
							input logic [31:0] instruction,
							//---Control Unit outputs---//
							output logic [1:0] JMPSel,
							output logic WriteRegister,
							output logic MemWrite,
							output logic RegWrite,
							output logic vcsub,
							output logic [2:0] ALUOp,
							output logic [1:0] SelectorOpB,
							output logic [1:0] BranchSel,
							output logic [1:0]SelectorOpA,
							output logic SelWriteData,
							output logic WriteRegisterVec,
							//---Registers and imm output---//
							output logic [31:0] RSout1,RSout2,
							output logic [31:0]ImmSignExtended,
							output logic [255:0] VSout1, VSout2,
							output logic [31:0] Address);


logic [4:0]Rs2;
logic SelectorRs2,SelectorRs1; // This signal comes from Control Unit.





//						OPcode				ALUop
Control_Unit CU (instruction[31:27],instruction[11:9],JMPSel,WriteRegister,MemWrite,RegWrite,vcsub,ALUOp,SelectorOpB,SelectorRs2,BranchSel,SelectorOpA,SelWriteData,WriteRegisterVec,SelectorRs1);

//									 .Rs2 from instruction.
mux2Decode M2D (SelectorRs2,instruction[16:12],Rs2);

//														  Rs1  								    // Number of bits has to be specified because INPUTDATA is 256 bus, and in this case we just use the last 32 bits.            
scalar_registers SR (WRITEREGISTER_WB, clk, instruction[21:17], Rs2, RD_WB, INPUTDATA[31:0],RSout1,RSout2);

//						 Imm
SignExtend16 SE16 (instruction[16:1],ImmSignExtended);

//															   Rs1                 Rs2
top_vectorial_reg VR (WRITEREGISTERVEC_WB, clk, instruction[21:17], instruction[16:12],RD_WB, INPUTDATA, VSout1, VSout2);

//										This signal goes backwards fetch.
extend5 E5 (instruction[26:0],Address);





endmodule 

