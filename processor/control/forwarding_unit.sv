module forwarding_unit(input logic wb_sel, write_enable_mem, write_enable_wb,
								input logic [4:0] rs1_ex, rs2_ex, rd_mem, rd_wb,
								input logic[127:0] result_mem, result_wb,
								output logic stall, OpAForward, OpBForward,
								output logic[31:0] resultA, resultB,
								output logic[127:0] vresultA, vresultB);

logic OpAForwardMEM, OpAForwardWB, OpBForwardMEM, OpBForwardWB;

assign OpAForward = OpAForwardMEM | OpAForwardWB;
assign OpBForward = OpBForwardMEM | OpBForwardWB;

								
always_comb
	begin
	if(write_enable_mem & wb_sel & (rd_mem == rs1_ex))
		begin
			OpAForwardMEM = 1;
			OpBForwardMEM = 0;
			stall = 0;
		end
	else if(write_enable_mem & wb_sel & (rd_mem == rs2_ex))
		begin
			OpAForwardMEM = 0;
			OpBForwardMEM = 1;
			stall = 0;
		end
	else if(write_enable_mem & !wb_sel & ((rd_mem == rs1_ex) | (rd_mem == rs2_ex)))
		begin
			OpAForwardMEM = 0;
			OpBForwardMEM = 0;
			stall = 1;
		end
	else
		begin
			OpAForwardMEM = 0;
			OpBForwardMEM = 0;
			stall = 0;
		end
		
	if(write_enable_wb & (rd_wb == rs1_ex))
		begin
			OpAForwardWB = 1;
			OpBForwardWB = 0;
		end
	else if(write_enable_wb & (rd_wb == rs2_ex))
		begin
			OpAForwardWB = 0;
			OpBForwardWB = 1;
		end
	else
		begin
			OpAForwardWB = 0;
			OpBForwardWB = 0;
		end
	
	if(OpAForwardMEM)
		begin
			resultA = result_mem[31:0];
			vresultA = result_mem;
		end
	else if(OpAForwardWB)
		begin
			resultA = result_wb[31:0];
			vresultA = result_wb;
		end
	else
		begin
			resultA = 'z;
			vresultA = 'z;
		end
		
	if(OpBForwardMEM)
		begin
			resultB = result_mem[31:0];
			vresultB = result_mem;
		end
	else if(OpBForwardWB)
		begin
			resultB = result_wb[31:0];
			vresultB = result_wb;
		end
	else
		begin
			resultB = 'z;
			vresultB = 'z;
		end
	end
endmodule
