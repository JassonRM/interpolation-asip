module forwarding_unit(input logic wb_sel, write_enable_mem, write_enable_wb,
								input logic [4:0] rs1_ex, rs2_ex, rd_mem, rd_wb,
								input logic[255:0] result_mem, result_wb,
								output logic stall, OpAForward, OpBForward,
								output logic[31:0] result,
								output logic[255:0] vresult);
								
always_comb
	if(write_enable_mem & (rd_mem == rs1_ex))
		if(wb_sel)
			begin
				result = result_mem[31:0];
				vresult = result_mem;
				OpAForward = 1;
				OpBForward = 0;
				stall = 0;
			end
		else
			begin
				result = 'z;
				vresult = 'z;
				OpAForward = 0;
				OpBForward = 0;
				stall = 1;
			end
	else if(write_enable_mem & wb_sel & (rd_mem == rs2_ex))
		if(wb_sel)
			begin
				result = result_mem[31:0];
				vresult = result_mem;
				OpAForward = 0;
				OpBForward = 1;
				stall = 0;
			end
		else
			begin
				result = 'z;
				vresult = 'z;
				OpAForward = 0;
				OpBForward = 0;
				stall = 1;
			end
	else if(write_enable_wb & (rd_wb == rs1_ex))
		begin
			result = result_wb[31:0];
			vresult = result_wb;
			OpAForward = 1;
			OpBForward = 0;
			stall = 0;
		end
	else if(write_enable_wb & (rd_wb == rs2_ex))
		begin
			result = result_wb[31:0];
			vresult = result_wb;
			OpAForward = 0;
			OpBForward = 1;
			stall = 0;
		end
	else
		begin
			result = 'z;
			vresult = 'z;
			OpAForward = 0;
			OpBForward = 0;
			stall = 0;
		end
endmodule
