module PC_deco(input logic [1:0] BranchSel,
					input logic eq, bgt,
					input logic [1:0] JMPSel,
					output logic [1:0] NextInstrSel);
					
					always @(*) begin
						
						case({BranchSel,eq, bgt,JMPSel})
							6'b000000 : NextInstrSel <= 2'b00; // If BranchSel is 00, does not matter flags, and JMPSel is 00, go to instr[PC + 4].
							6'b011000 : NextInstrSel <= 2'b11; // If BranchSel is 01(means that instr is BE), flag of eq is true, and JMPSel is 00, go to instr[AddressB]. AddressB -> Especial calculated Address instruction.
							6'b100100 : NextInstrSel <= 2'b11; // If BranchSel is 10(means that instr is BGT), flag of bgt is true, and JMPSel is 00, go to instr[AddressB].
							6'b000001 : NextInstrSel <= 2'b01; // If BranchSel is 00, does not matter flags, and JMPSel is 01, instr[AddressI]. AddressI specified into the current instruction.
							6'b000010 : NextInstrSel <= 2'b01; // If BranchSel is 00, does not matter flags, and JMPSel is 10, instr[AddressR]. AddressR comes into the value of a register.
							default : NextInstrSel <= 2'b00; // Always going to the very early next instruction.
						endcase
					
					end

endmodule
