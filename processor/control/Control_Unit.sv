module Control_Unit (input logic [4:0] OPcode,
							input logic [2:0] ALUop,
							output logic [15:0]out_put);
							
							logic [1:0] JMPSel;
							logic WriteRegister;
							logic MemWrite;
							logic [1:0]RegWrite;
							logic [1:0] vcsub;
							logic [2:0] ALUOp;
							logic [1:0] SelectorOpB;
							logic SelectorRs2;
							logic [1:0] BranchSel;
							
							//       1      2              3         4         5      6      7            8            9          -> Data order.                                   
							assign {JMPSel, WriteRegister, MemWrite, RegWrite, vcsub, ALUOp, SelectorOpB, SelectorRs2, BranchSel} = out_put;
							
							always @(OPcode, ALUop) begin
								case ({OPcode,ALUop})       //  1 234 5 6  7 89   -> Those numbers match with the Data order specified before.
									8'b00000000 : out_put <= 16'b0010010000000000; // Control signals for ADD.
									8'b01000000 : out_put <= 16'b0010010000001000; // Control signals for ADD Inmediate.
									8'b00000001 : out_put <= 16'b0010010000100000; // Control signals for SUB.
									8'b01001001 : out_put <= 16'b0010010000101000; // Control signals for SUB Inmediate.
									8'b00000010 : out_put <= 16'b0010010001000000; // Control signals for MUL.
									8'b00000100 : out_put <= 16'b0010010010000000; // Control signals for Shift Left.
									8'b00000101 : out_put <= 16'b0010010010100000; // Control signals for AND.
									8'b00000110 : out_put <= 16'b0010010011000000; // Control signals for Shift Right.
								endcase
							end
endmodule
