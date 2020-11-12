`timescale 1 ps/ 1 ps
// run with vsim -gui -l msim_transcript -L altera_mf_ver -L lpm_ver work.test_b
module test_b();

logic clk;
logic [7:0] A,B, quo, rem;


div_prueba DUT (.denom ( B ), .numer ( A ), .quotient ( quo ), .remain ( rem ));

initial begin
	clk = 0;
	#10 A = 4;
	#10 B = 2;
end



always
	#10 clk <= !clk;




endmodule