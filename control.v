module control (pc_src,rf_wen,rf_a,rf_data,alu_a,alu_b,aluc,dm_wen,dm_add,dm_data,stack_rwb,stack_en,opcode,funct);
	input [3:0] opcode, funct;
	output reg [1:0] pc_src,rf_a,rf_data,alu_a,alu_b,dm_add,dm_data;
	output reg rf_wen,dm_wen,stack_rwb,stack_en;
	output reg [2:0] aluc;
	
	always @ (*)
		begin
			case(opcode)
					4'd0: begin                              //add
						pc_src  <= 2'd0;
						rf_wen  <= 1'b1;
						rf_a    <= 2'd0;
						rf_data <= 2'd0;
						alu_a   <= 2'd0;
						alu_b   <= 2'd0;
						aluc    <= 3'd0;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
					4'd1: begin                             //sub
						pc_src  <= 2'd0;
						rf_wen  <= 1'b1;
						rf_a    <= 2'd0;
						rf_data <= 2'd0;
						alu_a   <= 2'd0;
						alu_b   <= 2'd0;
						aluc    <= 3'd1;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
					4'd2: begin                            //nand
						pc_src  <= 2'd0;
						rf_wen  <= 1'b1;
						rf_a    <= 2'd0;
						rf_data <= 2'd0;
						alu_a   <= 2'd0;
						alu_b   <= 2'd0;
						aluc    <= 3'd2;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
					4'd3: begin                           
						if(funct == 4'd0)                 //neg  
							begin
								pc_src  <= 2'd0;
								rf_wen  <= 1'b1;
								rf_a    <= 2'd0;
								rf_data <= 2'd0;
								alu_a   <= 2'd0;
								alu_b   <= 2'd0;
								aluc    <= 3'd3;
								dm_wen  <= 1'b0;
								dm_add  <= 2'bxx;
								dm_data <= 2'bxx;
								stack_en <= 1'b0;
								stack_rwb <= 1'bx;
							end
						else if(funct == 4'd1)            //sar 
							begin
								pc_src  <= 2'd0;
								rf_wen  <= 1'b1;
								rf_a    <= 2'd1;
								rf_data <= 2'd0;
								alu_a   <= 2'd0;
								alu_b   <= 2'd2;
								aluc    <= 3'd4;
								dm_wen  <= 1'b0;
								dm_add  <= 2'bxx;
								dm_data <= 2'bxx;
								stack_en <= 1'b0;
								stack_rwb <= 1'bx;
							end
						else if(funct == 4'd2)           //shr
							begin
								pc_src  <= 2'd0;
								rf_wen  <= 1'b1;
								rf_a    <= 2'd1;
								rf_data <= 2'd0;
								alu_a   <= 2'd0;
								alu_b   <= 2'd2;
								aluc    <= 3'd5;
								dm_wen  <= 1'b0;
								dm_add  <= 2'bxx;
								dm_data <= 2'bxx;
								stack_en <= 1'b0;
								stack_rwb <= 1'bx;
							end
						else if(funct == 4'd3)           //shl  
							begin
								pc_src  <= 2'd0;
								rf_wen  <= 1'b1;
								rf_a    <= 2'd1;
								rf_data <= 2'd0;
								alu_a   <= 2'd0;
								alu_b   <= 2'd2;
								aluc    <= 3'd6;
								dm_wen  <= 1'b0;
								dm_add  <= 2'bxx;
								dm_data <= 2'bxx;
								stack_en <= 1'b0;
								stack_rwb <= 1'bx;
							end
					end
					
					4'd4: begin                       //push
						pc_src  <= 2'd0;
						rf_wen  <= 1'b0;
						rf_a    <= 2'd1;
						rf_data <= 2'bxx;
						alu_a   <= 2'd0;
						alu_b   <= 2'bxx;
						aluc    <= 3'bxxx;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b1;
						stack_rwb <= 1'b0;
					end
					
					4'd5: begin                       //pop
						pc_src  <= 2'd0;
						rf_wen  <= 1'b1;
						rf_a    <= 2'd1;
						rf_data <= 2'd2;
						alu_a   <= 2'd0;
						alu_b   <= 2'bxx;
						aluc    <= 3'bxxx;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b1;
						stack_rwb <= 1'b1;
					end
					
					4'd6: begin                       //addm
						pc_src  <= 2'd0;
						rf_wen  <= 1'b0;
						rf_a    <= 2'd1;
						rf_data <= 2'd0;
						alu_a   <= 2'd0;
						alu_b   <= 2'd1;
						aluc    <= 3'd0;
						dm_wen  <= 1'b0;
						dm_add  <= 2'd0;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
					
					4'd7: begin                       //slrm
						pc_src  <= 2'd0;
						rf_wen  <= 1'b0;
						rf_a    <= 2'd1;
						rf_data <= 2'bxx;
						alu_a   <= 2'd0;
						alu_b   <= 2'bxx;
						aluc    <= 3'bxxx;
						dm_wen  <= 1'b1;
						dm_add  <= 2'd0;
						dm_data <= 2'd1;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end 
					4'd8: begin                          //lw
						pc_src  <= 2'd0;
						rf_wen  <= 1'b1;
						rf_a    <= 2'bxx;
						rf_data <= 2'd1;
						alu_a   <= 2'd0;
						alu_b   <= 2'bxx;
						aluc    <= 3'bxxx;
						dm_wen  <= 1'b0;
						dm_add  <= 2'd0;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
					4'd9: begin                         //sw
						pc_src  <= 2'd0;
						rf_wen  <= 1'b0;
						rf_a    <= 2'd2;
						rf_data <= 2'bxx;
						alu_a   <= 2'd0;
						alu_b   <= 2'bxx;
						aluc    <= 3'bxxx;
						dm_wen  <= 1'b1;
						dm_add  <= 2'd1;
						dm_data <= 2'd0;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
					4'd12: begin                        //jmp
						pc_src  <= 2'd2;
		     			rf_wen  <= 1'b0;
						rf_a    <= 2'bxx;
						rf_data <= 2'bxx;
						alu_a   <= 2'd0;
						alu_b   <= 2'bxx;
						aluc    <= 3'bxxx;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
					4'd13: begin                       //beq
						pc_src  <= 2'd1;
						rf_wen  <= 1'b0;
						rf_a    <= 2'd0;
						rf_data <= 2'bxx;
						alu_a   <= 2'd0;
						alu_b   <= 2'd0;
						aluc    <= 3'd7;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
				
				default: begin                       
						pc_src  <= 2'bxx;
						rf_wen  <= 1'b0;
						rf_a    <= 2'bxx;
						rf_data <= 2'bxx;
						alu_a   <= 2'bxx;
						alu_b   <= 2'bxx;
						aluc    <= 3'bxxx;
						dm_wen  <= 1'b0;
						dm_add  <= 2'bxx;
						dm_data <= 2'bxx;
						stack_en <= 1'b0;
						stack_rwb <= 1'bx;
					end
			endcase
		end
endmodule