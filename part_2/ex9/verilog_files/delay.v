module delay(clk, N, trigger, time_out);

	parameter BIT_SZ = 14;

	input clk, trigger;
	input [BIT_SZ-1:0] N;
	output time_out;

	reg[BIT_SZ-1:0] count;
	reg time_out;

	reg [1:0] state;

	parameter IDLE = 2'b0, COUNTING = 2'b1, TIME_OUT = 2'b10, WAIT_LOW = 2'b11;

	initial begin
		state = IDLE;
	end
	
	always @ (posedge clk)
		case(state)
			IDLE: if(trigger == 1'b1)
				begin
					count <= N*128;
					state <= COUNTING;
				end
			COUNTING: 
				begin
					if(count == 1'b0)
						begin
							state <= TIME_OUT;
						end
					else 
						count <= count - 1'b1;
				end
			TIME_OUT: 
				begin
					if(trigger == 1'b0)
						state <= IDLE;
					else
						state <= WAIT_LOW;
				end
			WAIT_LOW: 
				if(trigger == 1'b0)
					state <= IDLE;
			default: ;
		endcase
		
	always @ (*)
		case(state)
			IDLE: 		time_out = 1'b0;
			COUNTING:	time_out = 1'b0;
			TIME_OUT: 	time_out = 1'b1;
			WAIT_LOW: 	time_out = 1'b0;
			default: ;
		endcase

endmodule