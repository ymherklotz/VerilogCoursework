`timescale 1ns / 100ps

module counter_16(clock,enable,reset,count);

	parameter BIT_SZ = 16;
	input clock, enable, reset;
	output [BIT_SZ-1:0] count;
	
	reg [BIT_SZ-1:0] count;
	
	initial count = 0;
	
	always @ (posedge clock)
		begin
			if(enable == 1'b1)
				count <= count + 1'b1;
			if(reset == 1'b1)
				count <= 16'b0;
		end
			
endmodule