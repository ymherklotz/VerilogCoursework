module processor (sysclk, tick, SW, data_in, data_out, data_valid, hex0, hex1, hex2, hex3, hex4);

	input				sysclk, tick, data_valid;		// system clock
	input [9:0]		data_in;
	output [9:0] 	data_out;	// 10-bit output data

	output [6:0]  	hex0, hex1, hex2, hex3, hex4;
	
	input [9:0]		SW;
	
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire [9:0]		tmp_data, echoed_data;
	
	wire [12:0]		raw_address;
	
	wire [19:0]		delay;
	
	wire [3:0]		bcd0, bcd1, bcd2, bcd3, bcd4;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x = data_in - ADC_OFFSET;		// x is input in 2's complement
	
	ctr_13_bit ctr(~data_valid, raw_address);
	
	delay_block del(sysclk, data_in, raw_address, tick, raw_address + {SW[8:0], 4'b0}, tick, tmp_data);
	
	div_by_2({tmp_data[8],tmp_data}, echoed_data);
		
	mult_by_h666 mul_by_h666(SW, delay);
		
	bin2bcd_16 bcd(delay[19:10], bcd0, bcd1, bcd2, bcd3, bcd4);
		
	hex_to_7seg h0(hex0, bcd0);
	hex_to_7seg h1(hex1, bcd1);
	hex_to_7seg h2(hex2, bcd2);
	hex_to_7seg h3(hex3, bcd3);
	hex_to_7seg h4(hex4, bcd4);
		
	assign y = x + echoed_data;
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	