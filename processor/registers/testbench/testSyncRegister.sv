module testSyncRegister;

	logic clk, rst;
	logic[127:0] d, q;

	syncRegister #(128) DUT(clk, rst, d, q);

	initial begin 
		clk =0;
		rst =0;
		d = 25;
		
		$display("begining of test");
		
		#15;
		assert (q == d) $display("1st register test complete");
		else $error ("1st register test error"); 
		
		//rst test
		rst = 1;
		
		assert (q == d) $display("2nd register test complete");
		else $error ("2nd register test error");
			
		#20 assert (q == 0) $display("3rd register test complete");
		else $error ("3rd register test error");
			
		rst = 0; //end rst test
		
		//propagation test
		
		d = 128'd678;
		
		#20 assert (q == d) $display("4th register test complete");
		else $error ("4th register test error");
		
		#18 d = 128'd123;
		
		#2 assert (q == 128'd678) $display("5th register test complete");
		else $error ("5th register test error");
		
		$display("End of test");
	end

	always
		#10 clk <= !clk;
	
endmodule 