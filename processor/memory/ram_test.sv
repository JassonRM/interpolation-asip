`timescale 1 ps / 1 ps

module ram_test();

	logic clk, write_enable_a, write_enable_b;
	logic[14:0] address_a;
	logic[18:0] address_b;
	logic[127:0] data_a, out_a;
	logic[7:0] data_b, out_b;

	ram_encrypted DUT(address_a, address_b, clk, data_a, data_b, write_enable_a, write_enable_b, out_a, out_b);

	initial begin
		#10 write_enable_a = 0; write_enable_b = 0; address_b = 15'd4; address_a = 19'd0; data_a = 'z; data_b = 'z; clk = 0;
		#10 write_enable_b = 1; address_b = 15'd2; data_b = 8'd99;
		#10 write_enable_b = 0;
		#10 address_b = 15'd3;
		#12 address_a = 19'd8;
	end	

	always #5 clk <= !clk;

endmodule