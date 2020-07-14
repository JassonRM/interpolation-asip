module syncRegister #(parameter n = 32) 
							(input logic clk, rst, stall,
							input logic[n-1:0] d,
							output logic[n-1:0] q);

	always_ff @(negedge clk)
		if (rst)
			q <= 0;
		else if(!stall)
			q <= d;
		else
			q <= q;
						
endmodule 
