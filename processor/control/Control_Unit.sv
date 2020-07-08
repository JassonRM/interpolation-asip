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
							output logic SelectorOpA,
							output logic SelWriteData);
							
							logic [17:0]out_put;
							
							//       1      2              3         4         5      6      7            8            9         10                       -> Data order.                                   
							assign {JMPSel, WriteRegister, MemWrite, RegWrite, vcsub, ALUOp, SelectorOpB, SelectorRs2, BranchSel,SelectorOpA,SelWriteData} = out_put;
							
							always @(*) begin
								case ({OPcode,ALUop})       //  1 234 5 6  7 89 10  -> Those numbers match with the Data order specified before.
								   
									8'b00000000 : out_put <= 18'b001001000000000000; // Control signals for ADD.
									8'b01000000 : out_put <= 18'b001001000000100000; // Control signals for ADD Inmediate.
									8'b00000001 : out_put <= 18'b001001000010000000; // Control signals for SUB.
									8'b01001001 : out_put <= 18'b001001000010100000; // Control signals for SUB Inmediate.
									8'b00000010 : out_put <= 18'b001001000100000000; // Control signals for MUL.
									8'b00000100 : out_put <= 18'b001001001000000000; // Control signals for Shift Left.
									8'b00000101 : out_put <= 18'b001001001010000000; // Control signals for AND.
									8'b00000110 : out_put <= 18'b001001001100000000; // Control signals for Shift Right.
									
									8'b00010000 : out_put <= 18'b001000000001010000; // Control signals for LoadWord.
									8'b00011000 : out_put <= 18'b001000000001010010; // Control signals for LoadHalfWord.
									8'b00100000 : out_put <= 18'b0001xx000001000000; // Control signals for StoreWord.
									8'b00101000 : out_put <= 18'b0001xx000001000011; // Control signals for StoreHalfWord.
									
									8'b10000000 : out_put <= 18'b01xxxxxxxxxxxx00xx; // Control signals for JMP.
									8'b00110000 : out_put <= 18'b10xxxxxxxxxxxx00xx; // Control signals for JR.
									8'b10001000 : out_put <= 18'b00xxxxxxxxxxxx00xx; // Control signals for CALL (Check it after).
									8'b01010000 : out_put <= 18'b01xxxxxx001000100x; // Control signals for BE.
									8'b01011000 : out_put <= 18'b10xxxxxx001000100x; // Control signals for BGT.
									default		: out_put <= 18'bxxxxxxxxxxxxxxxxxx;
								endcase
							end
endmodule
