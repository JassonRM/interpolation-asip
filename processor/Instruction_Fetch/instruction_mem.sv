module instruction_mem(input logic [31:0] a,
							  output logic [31:0] rd);
							  
							  logic [31:0] RAM [63:0];
							  initial
							   $readmemh("C:\\Users\\Edgar\\Documents\\Year_2020\\Arqui\\Proyecto2\\ModulosHDL\\testOut.txt", RAM);
							  assign rd = RAM[a[31:2]];
endmodule