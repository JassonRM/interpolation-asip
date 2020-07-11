module vectorialRegAddress (input logic [4:0] Rs1, Rs2,rd,
								    output logic [4:0]Rout1, Rout2, RoutD);
									 
									 always @(*) begin
										case(Rs1)
											5'd16  : Rout1 <= 5'd0;
											5'd17  : Rout1 <= 5'd1;
											5'd18  : Rout1 <= 5'd2;
											5'd19  : Rout1 <= 5'd3;
											5'd20  : Rout1 <= 5'd4;
											5'd21  : Rout1 <= 5'd5;
											5'd22  : Rout1 <= 5'd6;
											5'd23  : Rout1 <= 5'd7;
											default: Rout1 <= 5'bx; 
										endcase
										case(Rs2)
											5'd16  : Rout2 <= 5'd0;
											5'd17  : Rout2 <= 5'd1;
											5'd18  : Rout2 <= 5'd2;
											5'd19  : Rout2 <= 5'd3;
											5'd20  : Rout2 <= 5'd4;
											5'd21  : Rout2 <= 5'd5;
											5'd22  : Rout2 <= 5'd6;
											5'd23  : Rout2 <= 5'd7;
											default: Rout2 <= 5'bx; 
										endcase
										case(rd)
											5'd16  : RoutD <= 5'd0;
											5'd17  : RoutD <= 5'd1;
											5'd18  : RoutD <= 5'd2;
											5'd19  : RoutD <= 5'd3;
											5'd20  : RoutD <= 5'd4;
											5'd21  : RoutD <= 5'd5;
											5'd22  : RoutD <= 5'd6;
											5'd23  : RoutD <= 5'd7;
											default: RoutD <= 5'bx; 
										endcase
									 end
endmodule
