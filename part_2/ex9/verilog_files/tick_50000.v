module tick_50000(CLOCK_IN, CLK_OUT);

	parameter NBIT = 16;
	
	input CLOCK_IN;
	output CLK_OUT;
	
	reg [NBIT-1:0] count;
	
	reg CLK_OUT;
	
	initial 
		begin
			count = 16'd49999;
			CLK_OUT = 1'b0;
		end
	
	always @ (posedge CLOCK_IN)
		begin
			if(count == 16'b0)
				begin
					CLK_OUT <= 1'b1;
					count <= 16'd49999;
				end
			else
				begin
					count <= count - 1'b1;
					CLK_OUT <= 1'b0;
				end
		end

endmodule