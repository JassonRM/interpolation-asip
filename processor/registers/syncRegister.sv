module syncRegister #(parameter n = 32) 
							(input logic clk, rst,
							input logic[n-1:0] d,
							output logic[n-1:0] q);

	always_ff @(posedge clk)
		if (rst)
			q <= 0;
		else
			q <= d;
						
endmodule 
