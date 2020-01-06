module mux_2x1_16b(dout,d1,d2,s);
	output reg [15:0] dout;
	input [15:0] d1,d2;
	input s;
	always @(*)
		begin
			case (s)
				1'b0: dout<=d1;
				1'b1: dout<=d2;
				default: dout<=4'd0;
			endcase
		end
endmodule