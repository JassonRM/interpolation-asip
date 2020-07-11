module Decode_Reg (input logic clk, rst, WriteRegister,
						 input logic MemWrite,
						 input logic RegWrite,
						 input logic [1:0] vcsub,
						 input logic [2:0] ALUOp,
						 input logic [1:0] SelectorOpB,
						 input logic SelectorRs2,
						 input logic [1:0] BranchSel,
						 input logic [1:0]SelectorOpA,
						 input logic SelWriteData,
						 input logic WriteRegisterVec,
						 input logic [31:0] Rs1, Rs2,
						 input logic [4:0] InstrRs1, InstrRs2, 
						 input logic [255:0] VRs1,Vrs2,
						 input logic [31:0] ExtendedRs1,ExtendedRs2,
						 input logic [4:0] rd,
						
						 output logic WIRTEREGISTER,
						 output logic MEMRITE,
						 output logic REGWRITE,
						 output logic [1:0] VCSUB,
						 output logic [2:0] ALUOP,
						 output logic [1:0] SELECTOROPB,
						 output logic SELECTORRS2,
						 output logic [1:0] BRANCHSEL,
						 output logic [1:0] SELECTOROPA,
						 output logic SELWRITEDATA,
						 output logic WRITEREGISTERVEC,
						 output logic [31:0] RS1, RS2,
						 output logic [4:0] INSTRRS1, INSTRRS2,
						 output logic [255:0] VRS1, VRS2,
						 output logic [31:0] EXTENDERRS1, EXTENDERRS2,
						 output logic [4:0] RD);
						 
						 always_ff @(posedge clk) 
							if (rst) begin
								WIRTEREGISTER 		<= 1'b0;
						      MEMRITE 				<= 1'b0;			
								REGWRITE				<= 1'b0;
								VCSUB					<= 2'b0;
								ALUOP					<= 3'b0;
								SELECTOROPB			<= 2'b0;
								SELECTORRS2			<= 1'b0;
								BRANCHSEL			<= 2'b0;
								SELECTOROPA			<= 2'b0;
								SELWRITEDATA		<= 1'b0;
								WRITEREGISTERVEC	<= 1'b0;
								RS1					<= 32'b0;
								RS2					<= 32'b0;
								INSTRRS1				<= 5'b0;
								INSTRRS2				<= 5'b0;
								VRS1					<= 256'b0;
								VRS2					<= 256'b0;
								EXTENDERRS1			<= 32'b0;
								EXTENDERRS2			<= 32'b0;
								RD						<= 5'b0;
							
							end else begin
							
							WIRTEREGISTER 		   <= WriteRegister;
						      MEMRITE 				<= MemWrite;			
								REGWRITE				<= RegWrite;
								VCSUB					<= vcsub;
								ALUOP					<= ALUOp;
								SELECTOROPB			<= SelectorOpB;
								SELECTORRS2			<= SelectorRs2;
								BRANCHSEL			<= BranchSel;
								SELECTOROPA			<= SelectorOpA;
								SELWRITEDATA		<= SelWriteData;
								WRITEREGISTERVEC	<= WriteRegisterVec;
								RS1					<= Rs1;
								RS2					<= RS2;
								INSTRRS1				<= InstrRs1;
								INSTRRS2				<= INSTRRS2;
								VRS1					<= VRs1;
								VRS2					<= VRS2;
								EXTENDERRS1			<= ExtendedRs1;
								EXTENDERRS2			<= ExtendedRs2;
								RD						<= rd;
							
							end

endmodule
