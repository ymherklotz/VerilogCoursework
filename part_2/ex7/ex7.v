module ex7(KEY3, HEX0, HEX1);

	input KEY3;
	output [6:0] HEX0, HEX1;

	wire [7:0] count;
	
	LFSR(KEY3, count);
	
	hex_to_7seg h0(HEX0, count[3:0]);
	hex_to_7seg h1(HEX1, count[7:4]);

endmodule