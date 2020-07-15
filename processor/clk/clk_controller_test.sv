`timescale 1 ps / 1 ps
module clk_controller_test();

	logic refclk, rst, outclk_0, locked;

	clk_controller DUT(refclk, rst, outclk_0, locked);
	
	initial begin
	
	refclk = 0;
	rst = 0;
	
	#5000 rst = 1;
	#10000 rst = 0;
	end
	
	always #10000 refclk <= !refclk;
	
		
endmodule	



