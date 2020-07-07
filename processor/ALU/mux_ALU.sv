module mux_ALU (input logic [2:0]ALUop,
					 input logic [31:0] add, sub, mul, sleft, and_, sright, 
					 output logic [31:0]selected);
					 always @(ALUop, add,sub, mul, sleft, and_, sright) begin
						case (ALUop)
							3'b000 : selected = add;
							3'b001 : selected = sub;
							3'b010 : selected = mul;
							3'b100 : selected = sleft;
							3'b101 : selected = and_;
							3'b110 : selected = sright;
							default: selected = 32'b0;
						endcase				 
					 end
endmodule
