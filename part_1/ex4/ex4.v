module ex4(SW, HEX0, HEX1, HEX2, HEX3);

	input [9:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3;

	wire [3:0] w0, w1, w2, w3;

	bin2bcd_10(SW, w0, w1, w2, w3);

	hex_to_7seg(HEX0, w0);
	hex_to_7seg(HEX1, w1);
	hex_to_7seg(HEX2, w2);
	hex_to_7seg(HEX3, w3);


endmodule