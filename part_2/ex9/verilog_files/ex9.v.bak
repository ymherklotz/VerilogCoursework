module ex9(CLOCK_50, KEY, HEX0, HEX1, HEX2, LEDR);
	
	input CLOCK_50;
	input [3:0] KEY;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2;
	
	wire tick_ms, tick_hs, time_out, start_delay, en_lfsr;
	wire [6:0] N;
	wire [6:0] bcd_to_hex;
	wire[3:0] BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
	
	tick_50000 TICK0(CLOCK_50, tick_ms);
	tick_2500 TICK1(CLOCK_50, tick_ms, tick_hs);
	formula_fsm FSM(tick_ms, tick_hs, ~KEY[3], time_out, en_lfsr, start_delay, LEDR);
	LFSR LFSR0(tick_ms, en_lfsr, N);
	delay DEL0(tick_ms, N, start_delay, time_out);
	bin2bcd_16 BCD(N, BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	hex_to_7seg SEG0(HEX0, BCD_0);
	hex_to_7seg SEG1(HEX1, BCD_1);
	hex_to_7seg SEG2(HEX2, BCD_2);
	
endmodule