module Fetch_Reg (input logic clk, rst, 
					   input logic [31:0]Instr,
						output logic [4:0] OPcode,
						output logic [2:0] ALUop,
						output logic [4:0] Rs1,Rs2,Rd,
						output logic [15:0] Imm,
						output logic [26:0] Address);
						
						always_ff @(posedge clk) begin
						
							if (rst) begin
							
								OPcode  <= 5'b0;
						      ALUop   <= 3'b0;
						      Rs1	  <= 5'b0;
								Rs2	  <= 5'b0;
								Rd		  <= 5'b0;
						      Imm	  <= 16'b0;
						      Address <= 27'b0;
							end 
								
							else if (Instr[31:30] == 2'b00) begin // R type.
								OPcode <= Instr[31:27];
								Rd <= Instr[26:22];
								Rs1 <= Instr[21:17];
								Rs2 <= Instr[16:12];
								ALUop <= Instr[11:9];
								Imm	  <= 16'b0;
								Address <= 27'b0;
							end	
							else if (Instr[31:30] == 2'b01) begin // I type.
							
								OPcode <= Instr[31:27];
								Rd <= Instr[26:22];
								Rs1 <= Instr[21:17];
								Imm <= Instr[16:1];
								ALUop   <= 3'b0;
								Rs2	  <= 5'b0;
								Address <= 27'b0;
							end
							else if (Instr[31:30] == 2'b10) begin // J type
								OPcode <= Instr[31:27];
								Address <= Instr[26:0];
								ALUop   <= 3'b0;
						      Rs1	  <= 5'b0;
								Rs2	  <= 5'b0;
								Rd		  <= 5'b0;
						      Imm	  <= 16'b0;
								
							end 
							else if (Instr[31:30] == 2'b11) begin // V type.
								OPcode <= Instr[31:27];
								Rd <= Instr[26:22];
								Rs1 <= Instr[21:17];
								Rs2 <= Instr[16:12];
								ALUop <= Instr[11:9];
								Imm	  <= 16'b0;
								Address <= 27'b0;
							
							end 
							
							else begin
							
								OPcode  <= 5'b0;
						      ALUop   <= 3'b0;
						      Rs1	  <= 5'b0;
								Rs2	  <= 5'b0;
								Rd		  <= 5'b0;
						      Imm	  <= 16'b0;
						      Address <= 27'b0;
							end
							
						end
						
endmodule
