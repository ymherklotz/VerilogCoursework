module ex9(CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR);
	
	input CLOCK_50;
	input [3:0] KEY;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	wire tick_ms, tick_hs, time_out, start_delay, en_lfsr;
	wire [6:0] N;
	wire [6:0] bcd_to_hex;
	wire [3:0] BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
	wire [15:0] count_out;
	
	tick_50000 TICK0(CLOCK_50, tick_ms);
	
	formula_fsm FSM(tick_ms, ~KEY[3], time_out, en_lfsr, start_delay, LEDR);
	
	LFSR LFSR0(tick_ms, en_lfsr, N);
	
	delay DEL0(tick_ms, N, start_delay, time_out);
	
	counter_16 COUNT0(tick_ms, time_out, ~KEY[0], count_out);
	
	bin2bcd_16 BCD(count_out, BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	
	hex_to_7seg SEG0(HEX0, BCD_0);
	hex_to_7seg SEG1(HEX1, BCD_1);
	hex_to_7seg SEG2(HEX2, BCD_2);
	hex_to_7seg SEG3(HEX3, BCD_3);
	hex_to_7seg SEG4(HEX4, BCD_4);
	hex_to_7seg SEG5(HEX5, 4'b0);
	
endmodule