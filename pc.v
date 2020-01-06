module pc(iaddout,iaddin,clk,rst); //asynchronous reset 4-bit register
	output reg [8:0] iaddout;
	input [8:0] iaddin;
	input clk,rst;
	always @(posedge clk or negedge rst)
		begin
			if(!rst)
				iaddout <= 4'd0;
			else
				iaddout <= iaddin;
		end
endmodule


	
	
	
	
	
	
			