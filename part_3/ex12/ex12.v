module ex12(CLOCK_50, SW, HEX0, HEX1, HEX2);

	input CLOCK_50;
	input [9:0] SW;
	output [6:0] HEX0, HEX1, HEX2;
	
	wire[9:0] data;

	ROM r(SW, CLOCK_50, data);

	hex_to_7seg h0(HEX0, data[3:0]);
	hex_to_7seg h1(HEX1, data[7:4]);
	hex_to_7seg h2(HEX2, {2'b0, data[9:8]});

endmodule