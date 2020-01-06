`include "alu.v"
`include "datmem.v"
`include "inmem.v"
`include "psw.v"
`include "pc.v"
`include "register_file.v"
`include "mux_4x1_4b.v"
`include "mux_4x1_16b.v"
`include "mux_4x1_8b.v"
`include "mux_4x1_9b.v"
`include "stack_register.v"
`include "control.v"
module globalvar();
	reg full,empty;
	reg [3:0] adr;
	initial
		begin
			full = 1'b0;
			empty = 1'b1;
		end
endmodule

module datapath(rst,clk);
	input rst,clk;
	wire [15:0] in,ra,rb,wr_d,dout,y,sout,a,b,din;
	wire [7:0] dadd;
	wire [8:0] pcin,pc_inmem,pcin1,jadd;
	wire [3:0] w1,ra_ad;
	wire [2:0] aluctrl;
	wire [1:0] ra1ctrl,ra2ctrl,wrctrl,aluactrl,alubctrl,datmem1ctrl,datmem2ctrl,pcctrl;
	wire wen,z,rwb,stack_en,stack_rwb;
	mux_4x1_9b pcmux(pcin,pcin1,ra[8:0],jadd,4'd0,pcctrl);
	pc p(pc_inmem,pcin,clk,rst);
	assign pcin1 = pcin + 9'd1;
	inmem i(in,pc_inmem);
	assign jadd = { in[11],in[11:4] } + pcin1;
	mux_4x1_4b ramux(w1,in[7:4],in[11:8],in[3:0],4'd0,ra1ctrl);  
	mux_4x1_4b ra2mux(ra_ad,w1,in[11:8],4'd0,4'd0,{1'd0,z});
	mux_4x1_16b wrmux(wr_d,y,dout,sout,4'd0,wrctrl);
	register_file regfile(ra,rb,ra_ad,in[3:0],wr_d,in[11:8],wen);
	mux_4x1_16b aluamux(a,ra,dout,4'd0,4'd0,aluactrl);
	mux_4x1_16b alubmux(b,rb,dout,{12'd0,in[7:4]},{12'd0,in[11:8]},alubctrl);
	alu main_alu(y,z,a,b,aluctrl); 
	mux_4x1_8b datmem1_mux(dadd,in[7:0],in[11:4],4'd0,4'd0,datmem1ctrl);
	mux_4x1_16b datmem2_mux(din,ra,y,4'd0,4'd0,datmem2ctrl);
	datmem main_datmem(dout,din,dadd,rwb);		
	stack_register stack1(.dout(sout),.din(ra),.en(stack_en),.rwb(stack_rwb));
	control control1(.pc_src(pcctrl),.rf_wen(wen),.rf_a(ra1ctrl),.rf_data(wrctrl),.alu_a(aluactrl),.alu_b(alubctrl),.aluc(aluctrl),.dm_wen(rwb),.dm_add(datmem1ctrl),.dm_data(datmem2ctrl),.stack_rwb(stack_rwb),.stack_en(stack_en),.opcode(in[15:12]),.funct(in[3:0]));
	

endmodule

module tb_datapath();
	reg rst,clk;
	
	datapath uut(rst,clk);
	
	initial
		begin
			#00 clk = 1'b0 ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
			#50 clk = ~clk ;
		end
	
	initial
		begin
			#000 rst = 1'b0 ;
			#030 rst = 1'b1 ;
		end
	
	initial 
		begin
			#400 $stop;
		end
	
	initial
		begin
			$dumpfile("datapath.vcd");
			$dumpvars;
		end
endmodule


		
		
		

