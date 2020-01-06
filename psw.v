module psw(swout,swin,clk,rst); //asynchronous reset 4-bit register
	output reg [3:0] swout;
	input [3:0] swin;
	input clk,rst;
	always @(posedge clk or negedge rst)
		begin
			if(!rst)
				swout <= 4'b0000;
			else
				swout <= swin;
		end
endmodule

				
			