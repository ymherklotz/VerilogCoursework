module tick_2500(CLOCK_IN, en, CLK_OUT);

	parameter NBIT = 12;
	
	input CLOCK_IN, en;
	output CLK_OUT;
	
	reg [NBIT-1:0] count;
	
	reg CLK_OUT;
	
	initial 
		begin
			count = 12'd2499;
			CLK_OUT = 1'b0;
		end
	
	always @ (posedge CLOCK_IN)
		if(en == 1'b1)
			begin
				if(count == 1'b0)
					begin
						CLK_OUT <= 1'b1;
						count <= 12'd2499;
					end
				else
					begin
						count <= count - 1'b1;
						CLK_OUT <= 1'b0;
					end
			end
		else 
			CLK_OUT <= 1'b0;

endmodule