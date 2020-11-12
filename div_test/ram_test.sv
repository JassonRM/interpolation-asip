`timescale 1 ps/ 1 ps
module ram_test();

logic clk;
logic	[4:0]  address_a;
logic	[4:0]  address_b;
logic	  clock;
logic	[31:0]  data_a;
logic	[31:0]  data_b;
logic	wren_a;
logic	wren_b;
logic	[31:0]  q_a;
logic	[31:0]  q_b;
integer i,f;
ram DUT (.address_a ( address_a ), 
			.address_b ( address_b ),
			.clock ( clk ),
			.data_a ( data_a ),
			.data_b ( data_b ),
			.wren_a ( wren_a ),
			.wren_b ( wren_b ),
			.q_a ( q_a ),
			.q_b ( q_b )
			); 
initial begin
	clk = 0;
	#10 wren_a = 1;
	f = $fopen("C:/Users/WPC/Documents/div_test/output.txt");
	/*
	#10 address_a <= 10;
	#10 data_a <= 10;
	
	#10 address_a <= 11;
	#10 data_a <= 10;
	
	#10 address_a <= 12;
	#10 data_a <= 10;
	
	#10 address_a <= 13;
	#10 data_a <= 10;
	
	#10 address_a <= 14;
	#10 data_a <= 10;
	
	#10 address_a <= 14;
	#10 data_a <= 10;
	
	#10 address_a <= 0;
	#10 data_a <= 255;*/
	
	for (i = 0; i<31; i=i+1)begin
		 @(posedge clk);
		 address_a <= i;
		 data_a <= i*i;
		 #200;
	end
	
	#10 wren_a = 0;
	
	#10 address_a <= 1;
	
	#10 address_a <= 2;
	#10 address_a <= 3;
	#10 address_a <= 10;
	#10 address_a <= 11;
	
	
	
	
	
	//f = $fopen("output.txt","w");
	
	for (i = 0; i<31; i=i+1)begin
		 @(posedge clk);
		 address_a <= i;
       $fwrite(f,"%b",q_a);
		 #200;
	end
	$fclose(f);
end


	
always #10 clk <= !clk;
//always #10 address_a <= address_a + 1;
endmodule 


