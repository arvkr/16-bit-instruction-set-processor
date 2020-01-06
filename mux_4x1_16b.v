module mux_4x1_16b(dout,d1,d2,d3,d4,s);
	output reg [15:0] dout;
	input [15:0] d1,d2,d3,d4;
	input [1:0] s;
	always @(*)
		begin
			case (s)
				2'b00: dout<=d1;
				2'b01: dout<=d2;
				2'b10: dout<=d3;
				2'b11: dout<=d4;
				default: dout<=4'd0;
			endcase
		end
endmodule
