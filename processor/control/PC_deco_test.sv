`timescale 1 ps / 1 ps
module PC_deco_test();
	
	logic [1:0] BranchSel, JMPSel, NextInstrSel;
	logic eq, bgt;
	
	PC_deco DUT (BranchSel, eq, bgt, JMPSel, NextInstrSel);
	
	initial begin
		
		BranchSel = 2'b0;
		JMPSel = 2'b0;
		eq = 1'b1;
		bgt = 1'b1;
		
		
		#10 JMPSel = 2'b01;
		
		#10 JMPSel = 2'b10;
		
		#10 BranchSel = 2'b01;
		
		#10 BranchSel = 2'b10;
		
		#10 bgt = 1'b0;
	
	end
	

endmodule 