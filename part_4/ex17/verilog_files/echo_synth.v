module processor (sysclk, tick, data_in, data_out);

	input				sysclk, tick;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire [9:0]		tmp_data, echoed_data;
	wire is_full, and_if, from_dff;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	FIFO fifo(sysclk, x, and_if, tick, is_full, tmp_data);
	
	d_ff d(tick, is_full, from_dff);
	
	assign and_if = tick & from_dff;
	
	div_by_2(tmp_data, echoed_data);
		
	assign y = x + echoed_data;
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	