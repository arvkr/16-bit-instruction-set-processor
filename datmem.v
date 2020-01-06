module datmem(dout,din,dadd,rwb); //256 words in memory
	output reg [15:0] dout;
	input [15:0] din;
	input [7:0] dadd; //8 bit address
	input rwb;
	reg [15:0] mem [0:255];
	initial $readmemh("data.txt",mem);
	always @(*) // data memory will always read. when high active write signal is 1, then the data memory writes
		begin
			dout = mem[dadd];
			if(rwb==1'b1) 
				mem[dadd] = din;
		end
endmodule

			
