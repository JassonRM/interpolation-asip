module muxRegA (input logic [4:0]Rs1, Rd, 
					 input logic SelectorRs1,
					 output logic [4:0] Rs1_out);
					 
					 always_comb
					 begin
					 
						if(SelectorRs1 == 1'b0)
							Rs1_out <= Rs1;
						else
							Rs1_out <= Rd;
						
					 end
endmodule
