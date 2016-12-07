module counter_16(clock, start, stop, count);

	parameter BIT_SZ = 16;
	input clock, start, stop;
	output [BIT_SZ-1:0] count;
	
	reg [BIT_SZ-1:0] count;
	
	reg state;
	
	parameter COUNTING = 1'b1, IDLE = 1'b0;
	
	initial count = 0;
	initial state = IDLE;
	
	always @ (posedge clock)
		case(state)
			IDLE:
				if(start == 1'b1)
					begin
						count <= 0;
						state <= COUNTING;
					end
			COUNTING:
				if(stop == 1'b1)
					state <= IDLE;
				else
					count <= count + 1'b1;
		endcase
	
endmodule