module inmem(iout,iadd); //512 words in memory. Always reads. No read/write signal. Cannot write into instruction memory except through readmemh
	output reg [15:0] iout;
	input [8:0] iadd; //9 bit address
	reg [15:0] mem [0:511];
	initial $readmemh("instruc.txt",mem);
	always @(*)
		begin
			iout <= mem[iadd];
		end
endmodule
