`timescale 1 ps / 1 ps

module testBench_vectorial;

logic WriteEn,clk;
logic [4:0] Rs1, Rs2,rd;
logic [255:0]InputData;
logic [255:0]Rout1, Rout2;

	top_vectorial_reg DUT (WriteEn,clk,Rs1,Rs2,rd,InputData,Rout1,Rout2);
	
	initial begin
		WriteEn = 0;
		clk = 0;
		Rs1 = 5'd16; // -> This reg is converted to register 0;
		Rs2 = 5'd18; // -> This reg is converted to register 2;  
		rd = 5'd16;	 // -> This reg is converted to Register 0;
		#5 InputData = 256'd100;
		
		
		#7 WriteEn = 1;
		#7 WriteEn = 0;
		
		#5 rd = 5'd18;
		
		#7 WriteEn = 1;
		#7 WriteEn = 0;
	
	end
	
	always
		#5 clk <= !clk;

endmodule
