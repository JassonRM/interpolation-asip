`timescale 1 ps / 1 ps
module scalar_registers_test();

	logic WriteEn,clk;
	logic [4:0] Rs1, Rs2, rd;
	logic [31:0]InputData;
	logic [31:0]Rout1, Rout2;

	scalar_registers DUT(WriteEn, clk, Rs1, Rs2, rd, InputData, Rout1, Rout2);
	
	initial begin
		
		WriteEn = 0;
		clk = 0;
		Rs1 = 5'd0;
		Rs2 = 5'd2; 
		rd = 5'd0;
		#5 InputData = 32'd100;
		
		
		#7 WriteEn = 1;
		#7 WriteEn = 0;
		
		#5 rd = 5'd2;
		
		#7 WriteEn = 1;
		#7 WriteEn = 0;
		
	
	end

	always
		#5 clk <= !clk;
	
endmodule