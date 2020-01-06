module tb_alu();
	wire [15:0] y;
	wire z;
	reg [15:0] a,b;
	reg [2:0] aluc;
	
	alu uut(y,z,a,b,aluc);
	initial
		begin
			$dumpfile("alu.vcd");
			$dumpvars ;
		end
	
	initial
		begin
			#0 aluc=$random%8; a=15'd9; b=15'd2;
			#50 aluc=3'd0; a=15'd9; b=15'd2;
			#50 aluc=3'd1; a=15'd9; b=15'd2;
			#50 aluc=3'd2; a=15'd9; b=15'd2;
			#50 aluc=3'd3; a=15'd9; b=15'd2;
			#50 aluc=3'd4; a=15'd9; b=15'd2;
			#50 aluc=3'd5; a=15'd9; b=15'd2;
			#50 aluc=3'd6; a=15'd9; b=15'd2;
			#50 aluc=3'd7; a=15'd9; b=15'd2;
		end
endmodule



module tb_datmem();
	wire [15:0] dout;
	reg [15:0] din;
	reg [7:0] dadd; //8 bit address
	reg rwb;
	datmem uut(dout,din,dadd,rwb);
	
	initial
		begin
			$dumpfile("datmem.vcd");
			$dumpvars ;
		end
	initial
		begin
			#0 rwb=1'd1; dadd=8'd4; din= 16'h1212 ;  
			#50 rwb=1'd0; dadd=8'd4; din= 16'h12AB ; 
			#50 rwb=1'd0; dadd=8'd4; din= 16'h8576;
			#50 $stop;
		end
	
endmodule
	

module tb_inmem();
	wire [15:0] iout;
	reg [8:0] iadd; //9 bit address
	inmem uut(iout,iadd);
	
	initial
		begin
			$dumpfile("inmem.vcd");
			$dumpvars ;
		end
	initial
		begin
			#0  iadd=8'd4;   
			#50  iadd=8'd5;  
			#50  iadd=8'd8; 
			#50 $stop;
		end
	
endmodule
	

module tb_pc();
	wire [8:0] iaddout;
	reg [8:0] iaddin;
	reg clk,rst; 
	
	pc uut(iaddout,iaddin,clk,rst);

	
	initial
		begin
			#0 iaddin=9'd5;
			#100 iaddin=9'd7;
			#100 iaddin=9'd3;
			#100 iaddin=9'd21;
		end
			
			
initial
begin
#00 clk = 1'b0 ;
forever #50 clk = ~clk ;
end

initial
begin
#000 rst = 1'b1 ;
#030 rst = 1'b1 ;
#030 rst = 1'b1 ;
#900 rst = 1'b0 ;
#030 rst = 1'b1 ;
#800 rst = 1'b0 ;
#040 rst = 1'b1 ;
end
	
	initial #2000 $stop;
	
initial
begin
	$dumpfile("pc.vcd");
$dumpvars;
end
	
endmodule

module tb_register_file();
	reg [3:0] ra_adr,rb_adr,rc_adr;
	reg [15:0] rc_data;
	reg wen;
	wire [15:0] ra_data, rb_data;
	
	register_file uut(ra_data,rb_data,ra_adr,rb_adr,rc_data,rc_adr,wen);
	
	initial
		begin
			#0 ra_adr <= 4'd0;
			#0 rb_adr <= 4'd1;
			#0 rc_adr <= 4'd2;
			forever #50 ra_adr <= ra_adr +1;
		end
	
	initial forever #50 rb_adr <= rb_adr +1;
	initial	forever #50 rc_adr <= rc_adr +1;
	initial rc_data <= 16'hffff;
	
	initial
		begin
			#0 wen <= 1'b0;
			#70 wen <= 1'b1;
			#50 wen <= 1'b0;
			#120 wen <= 1'b1;
			#190 wen <= 1'b0;
		end
	
	initial #800 $stop ;
	
	initial
		begin
			$dumpfile("register_file.vcd");
			$dumpvars;
		end
endmodule

module tb_datapath();
	reg rst,clk;
	
	datapath uut(rst,clk);
	
	initial
		begin
			#00 clk = 1'b0 ;
			forever #50 clk = ~clk ;
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