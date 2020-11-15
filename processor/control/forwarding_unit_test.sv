module forwarding_unit_test();

logic wb_sel, write_enable_mem, write_enable_wb;
logic [4:0] rs1_ex, rs2_ex, rd_mem, rd_wb;
logic[127:0] result_mem, result_wb;
logic stall, OpAForward, OpBForward;
logic[31:0] resultA, resultB;
logic[127:0] vresultA, vresultB;

forwarding_unit DUT(wb_sel, write_enable_mem, write_enable_wb, rs1_ex, rs2_ex, rd_mem, rd_wb, result_mem, result_wb, stall, OpAForward, OpBForward, resultA, resultB, vresultA, vresultB);

initial begin

wb_sel = 1; write_enable_mem = 1; write_enable_wb = 1; rs1_ex = 'd1; rs2_ex = 'd2; rd_mem = 'd3; rd_wb = 'd4; result_mem = 'h1234567890ABCDEF; result_wb = 'hFEDCBA0987654321;

#10 rs1_ex = 'd3;
#10 rs2_ex = 'd4;
#10 wb_sel = 0;
#10 wb_sel = 1;
#10 write_enable_mem = 0;
#10 rs1_ex = 'd10;
#10 rs2_ex = 'd17; rd_wb = 'd17;
#10 wb_sel = 1;
#10 rd_mem = 'd17;
#10 write_enable_mem = 1;
#10 write_enable_wb = 0;

end

endmodule
