module execute_test();

logic VCSub, SelWriteData, Rs1_sel, Rs2_sel, OpAForward, OpBForward;
logic[1:0] SelectorOpA, SelectorOpB;
logic[2:0] ALUop;
logic[31:0] OpA, OpB, Imm, forwarded1, forwarded2;
logic[127:0] OpAV, OpBV, forwardedV1, forwardedV2;
logic Zero, Carry, OverFlow, Negative, eq, bgt;
logic[31:0] ALUresult, WriteData;
logic[127:0] VALUresult;

execute DUT(VCSub, SelWriteData, Rs1_sel, Rs2_sel, OpAForward, OpBForward, SelectorOpA, SelectorOpB, ALUop, OpA, OpB, Imm, forwarded1, forwarded2, OpAV, OpBV, forwardedV1, forwardedV2, Zero, Carry, OverFlow, Negative, eq, bgt, ALUresult, WriteData, VALUresult);

initial begin
VCSub = 0; SelWriteData = 0; Rs1_sel = 1; Rs2_sel = 1; OpAForward = 0; OpBForward = 0; SelectorOpA = 'd0; SelectorOpB = 'd0; ALUop = 'b000; OpA = 'd1234; OpB = 'd9999; Imm = 100; forwarded1 = 'd200; forwarded2 = 'd300; OpAV = 'hABCD; OpBV = 'h1234; forwardedV1 = 'd800; forwardedV2 = 'd900;

#10 SelectorOpA = 1;
#10 SelectorOpB = 1;
#10 SelectorOpA = 0;
#10 SelectorOpB = 0;
#10 ALUop = 'b001;
#10 Rs1_sel = 0;
#10 Rs1_sel = 1;
#10 Rs2_sel = 0;
#10 Rs2_sel = 1;
#10 SelWriteData = 1;
#10 SelWriteData = 0;
#10 OpAForward = 1;
#10 OpAForward = 0;
#10 OpBForward = 1;
#10 OpBForward = 0;
end

endmodule
