module testALU;

logic Cin;
logic [2:0] ALUop;
logic [31:0] OpA, OpB;
logic Cout;
logic [31:0] Result;
logic Zero, Carry, OverFlow, Negative, eq, bgt;

escalar_ALU DUT (Cin, ALUop, OpA, OpB, Cout, Result, Zero, Carry, OverFlow, Negative, eq, bgt);

	initial begin

		//Addition OpA > OpB:

		OpA = 3;
		OpB = 2;
		Cin = 0;
		ALUop = 3'b000;
		#10;
		
		//Addition OpA < OpB:
		
		OpA = 2;
		OpB = 3;
		Cin = 0;
		ALUop = 3'b000;
		#10;
		
		//Subtraction OpA > OpB:
		
		OpA = 10;
		OpB = 5;
		ALUop = 3'b001;
		#10;
		
		//Subtraction OpA < OpB:
		
		OpA = 5;
		OpB = 10;
		ALUop = 3'b001;
		#10;
		
		
		//Multiplication
		
		OpA = 1000;
		OpB = 30;
		ALUop = 3'b010;
		#10;
		
		// Logical Shift Left
		
		OpA = 10;
		OpB = 2;
		ALUop = 3'b100;
		#10;
		
		//And
		
		OpA = 10;
		OpB = 1;
		ALUop = 3'b101;
		#10;
		
		//Logical Shift Right
		
		OpA = 10;
		OpB = 1;
		ALUop = 3'b110;
		#10;
		
		

	end


endmodule
