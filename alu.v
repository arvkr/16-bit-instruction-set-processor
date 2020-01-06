module alu(y,z,a,b,aluc);
	output reg [15:0] y; //16 bit output
	output reg z; //zero line.
	input [15:0] a,b; //16 bit inputs
	input [2:0] aluc; //alu control sgl -- bitsize to be defined
	always @(*)
		begin
			z=1'b0;
			if(aluc == 3'b000 )
				y <= a+b;
			else if(aluc== 3'b001)
				y <= a-b;
			else if(aluc== 3'b010) 
				y <= a ~& b; //nand
			else if(aluc== 3'b011)
				y <= (~a) + 16'd1;  //2's complement
			else if(aluc== 3'b100)
				y <= a >>> b; //sar to 'a' by 'b' bits
			else if(aluc== 3'b101)
				y <= a >> b; //slr 'a' by 'b' bits
			else if(aluc== 3'b110)
				y <= a << b; // sll 'a' by 'b' bits
			else if(aluc== 3'b111)
				if(a==b)
					z <=1'b1;
		end
endmodule



	
		
		
		
		
		
		
		
		
		
		
			