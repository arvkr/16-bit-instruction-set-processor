module register_file(ra_data,rb_data,ra_adr,rb_adr,rc_data,rc_adr,wen);
	input [3:0] ra_adr, rb_adr, rc_adr;
	input [15:0] rc_data;
	input wen;
	output reg [15:0] ra_data, rb_data;
	
	reg [15:0] regmem [0:15];
	
	initial $readmemh("register_file.txt",regmem);
	
	always @ (*)
		begin
			ra_data <= regmem[ra_adr];
			rb_data <= regmem[rb_adr];
	    if(wen == 1'b1)                            //write data
				begin 
					regmem[rc_adr] <= rc_data;
				end					
		end
endmodule

