module LFSR(CLK, COUNT);
	input CLK;
	output[7:1] COUNT;
	reg[7:1] COUNT;
	initial COUNT = 7'd1;
		
	always @ (posedge CLK)
		COUNT <= {COUNT[6:1], COUNT[7] ^ COUNT[1]};
		
endmodule
	