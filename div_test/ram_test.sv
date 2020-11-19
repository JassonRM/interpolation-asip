`timescale 1 ps/ 1 ps
module ram_test();

logic clk;
/* this was for ram:
logic	[4:0]  address_a;
logic	[4:0]  address_b;
logic	  clock;
logic	[31:0]  data_a;
logic	[31:0]  data_b;
logic	wren_a;
logic	wren_b;
logic	[31:0]  q_a;
logic	[31:0]  q_b;
integer i, v,f;/*
/*
ram DUT (.address_a ( address_a ), 
			.address_b ( address_b ),
			.clock ( clk ),
			.data_a ( data_a ),
			.data_b ( data_b ),
			.wren_a ( wren_a ),
			.wren_b ( wren_b ),
			.q_a ( q_a ),
			.q_b ( q_b )
			); */
			
logic [14:0] address_sig;
logic [7:0] q_sig;
image_rom2	image_rom_inst (
	.address ( address_sig ),
	.clock ( clk ),
	.q ( q_sig )
	);
integer i, f;
initial begin
	/* This was for ram:
	clk = 0;
	#10 wren_a = 1;
	f = $fopen("C:/Users/WPC/Documents/div_test/output.txt");
	
	v = 0;
	
	for (i = 0; i<32; i=i+1)begin
		 @(posedge clk);
		 address_a <= i;
		 data_a <= {32{1'b1}};
		 #200;
	end
	#10 data_a <= 0;
	#10 wren_a = 0;
	
	
	
	#400 
	//f = $fopen("output.txt","w");
	
	for (i = 0; i<32; i=i+1)begin
		 @(posedge clk);
		 address_a <= i;
		 #200;
       $fwrite(f,"%b",q_a);
		 #200;
	end
	$fclose(f);*/
	
	
	//ROM
	clk = 0;
	#10;
	f = $fopen("C:/Users/WPC/Documents/div_test/output.txt");
	#400;
	for (i = 0; i < 32767; i = i +1)begin
		@(posedge clk);
		address_sig <= i;
		#200;
		$fwrite(f,"%b", q_sig);
		#200;
		
	end
	
end


	
always #10 clk <= !clk;
//always #10 address_a <= address_a + 1;
endmodule 


