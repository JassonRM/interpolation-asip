module Control_Unit (input logic [4:0] OPcode,
							input logic [2:0] ALUop,
							output logic [1:0] JMPSel,
							output logic WriteRegister,
							output logic MemWrite,
							output logic [1:0]RegWrite,
							output logic [1:0] vcsub,
							output logic [2:0] ALUOp,
							output logic [1:0] SelectorOpB,
							output logic SelectorRs2,
							output logic [1:0] BranchSel,
							output logic [1:0]SelectorOpA,
							output logic SelWriteData,
							output logic WriteRegisterVec);
							
							logic [17:0]out_put;
							
							//       1      2              3         4         5      6      7            8            9         A           B            C  -> Data order.                                   
							assign {JMPSel, WriteRegister, MemWrite, RegWrite, vcsub, ALUOp, SelectorOpB, SelectorRs2, BranchSel,SelectorOpA,SelWriteData,WriteRegisterVec} = out_put;
							
							always @(*) begin
								case ({OPcode,ALUop})       //  1 234 56  7 89 ABC  -> Those numbers match with the Data order specified before.
								   
									8'b00000000 : out_put <= 18'b001001000000000000; // Control signals for ADD.
									8'b01000000 : out_put <= 18'b001001000001000000; // Control signals for ADD Inmediate.
									8'b00000001 : out_put <= 18'b001001000100000000; // Control signals for SUB.
									8'b01001001 : out_put <= 18'b001001000101000000; // Control signals for SUB Inmediate.
									8'b00000010 : out_put <= 18'b001001001000000000; // Control signals for MUL.
									8'b00000100 : out_put <= 18'b001001010000000000; // Control signals for Shift Left.
									8'b00000101 : out_put <= 18'b001001010100000000; // Control signals for AND.
									8'b00000110 : out_put <= 18'b001001011000000000; // Control signals for Shift Right.
									
									8'b00010000 : out_put <= 18'b001000000010100000; // Control signals for LoadWord.
									8'b00011000 : out_put <= 18'b001000000010100010; // Control signals for LoadHalfWord.
									8'b00100000 : out_put <= 18'b0001xx000010000100; // Control signals for StoreWord.
									8'b00101000 : out_put <= 18'b0001xx000010000101; // Control signals for StoreHalfWord.
									
									8'b10000000 : out_put <= 18'b01xxxxxxxxxxx00xxx; // Control signals for JMP.
									8'b00110000 : out_put <= 18'b10xxxxxxxxxxx00xxx; // Control signals for JR.
									8'b10001000 : out_put <= 18'b00xxxxxxxxxxx00xxx; // Control signals for CALL (Check it after).
									8'b01010000 : out_put <= 18'b01xxxxx0010001000x; // Control signals for BE.
									8'b01011000 : out_put <= 18'b10xxxxx0010001000x; // Control signals for BGT.
									
									8'b11000010 : out_put <= 18'b0000100010xxx00xx1; // Control signals for VMUL.
									8'b11000111 : out_put <= 18'b0000100111xxx00xx1; // Control signals for VSR.
									8'b11000101 : out_put <= 18'b0000100101xxx00xx1; // Control signals for VSUB.
									8'b11110000	: out_put <= 18'b0000101101xxx00xx1; // Control signals for VCSUB.
									8'b11010000	: out_put <= 18'b0000100000xxx00xx1; // Control signals for VLDW.
									8'b11011000 : out_put <= 18'b0000100000xxx00xx1; // Control signals for VLDH.
									8'b11100000 : out_put <= 18'b0001xx0000xxx00xx0; // Control signals for VSTW.
									8'b11101000 : out_put <= 18'b0001xx0000xxx00xx0; // Control signals for VSTB.
									
									default		: out_put <= 18'bxxxxxxxxxxxxxxxxxx;
								endcase
							end
endmodule
