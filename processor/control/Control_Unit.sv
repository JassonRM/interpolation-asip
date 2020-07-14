module Control_Unit (input logic [4:0] OPcode,
							input logic [2:0] ALUop,
							output logic [1:0] JMPSel,
							output logic WriteRegister,
							output logic MemWrite,
							output logic RegWrite,
							output logic vcsub,
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
								case (OPcode)            //  1 23456  7 89 A BC  -> Those numbers match with the Data order specified before.
									5'b00000 : out_put <= {6'b001010, ALUop, 9'b000000000}; // Control signals for ADD, SUB, MUL, SL, AND, SR.
									5'b01000 : out_put <= 18'b001010000010000000; // Control signals for ADD Inmediate.
									5'b01000 : out_put <= 18'b001010000010000000; // Control signals for ADD Inmediate.
									5'b01001 : out_put <= 18'b001010001010000000; // Control signals for SUB Inmediate.
									5'b00010 : out_put <= 18'b001000000101000000; // Control signals for LoadWord.
									5'b00011 : out_put <= 18'b001000000101000100; // Control signals for LoadHalfWord.
									5'b00100 : out_put <= 18'b000100000000001000; // Control signals for StoreWord.
									5'b00101 : out_put <= 18'b000100000100001010; // Control signals for StoreHalfWord.
									5'b10000 : out_put <= 18'b010x0xxxxxxx00xxx0; // Control signals for JMP.
									5'b00110 : out_put <= 18'b100x0xxxxxxx00xxx0; // Control signals for JR.
									5'b10001 : out_put <= 18'b000x0xxxxxxx00xxx0; // Control signals for CALL (Check it after).
									5'b01010 : out_put <= 18'b000x0x0010000100x0; // Control signals for BE.
									5'b01011 : out_put <= 18'b000x0x0010001000x0; // Control signals for BGT.
									5'b11000 : out_put <= {6'b000010, ALUop, 9'bxx000xx11}; // Control signals for VMUL, VSR, VSUB.
									5'b11110	: out_put <= 18'b000011001xx000xx11; // Control signals for VCSUB.
									5'b11011 : out_put <= 18'b00000000010x000011; // Control signals for VLDH.
									5'b11101 : out_put <= 18'b00010000000x001100; // Control signals for VSTB.
									
									default		: out_put <= 18'bxxxxxxxxxxxxxxxxxx;
								endcase
							end
endmodule
