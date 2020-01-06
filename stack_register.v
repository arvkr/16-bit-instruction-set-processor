module stack_register(dout,din,en,rwb);
	input [15:0] din;
	input en, rwb;
	output reg [15:0] dout;
	reg [15:0] stackreg [0:15];
    	
	always @ (en)
		begin
			if(rwb) 
				begin
					if(!globalvar.empty)
						begin
							dout <= stackreg[globalvar.adr];
							globalvar.full <= 1'b0;
							if (globalvar.adr == 4'd0) globalvar.empty <= 1'b1;
							else              globalvar.adr  <= globalvar.adr - 1;
						end
					else dout <= 16'dz;
				end
			else if(!rwb)
				begin
					if(!globalvar.full)
						begin
							stackreg[globalvar.adr] <= din;
							globalvar.empty <= 1'b0;
							if(globalvar.adr == 4'd15) globalvar.full <= 1'b1;
							else              globalvar.adr <= globalvar.adr + 1;
						end
				end
		end
	
endmodule