module ex6(CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4);
	
	input CLOCK_50;
	input [1:0] KEY;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	
	wire [15:0] count;
	wire tick;
	wire [3:0] b0, b1, b2, b3, b4;
	
	tick_50000 tck(CLOCK_50, tick);
	
	counter_16 C(tick, ~KEY[0], ~KEY[1], count);
	
	bin2bcd_16 B(count, b0, b1, b2, b3, b4);
	
	hex_to_7seg SEG0(HEX0, b0);
	hex_to_7seg SEG1(HEX1, b1);
	hex_to_7seg SEG2(HEX2, b2);
	hex_to_7seg SEG3(HEX3, b3);
	hex_to_7seg SEG4(HEX4, b4);
	
endmodule













	
	
