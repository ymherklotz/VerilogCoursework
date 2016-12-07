module LFSR(CLK, en, COUNT);

	input CLK;
	input en;
	
	output [7:1] COUNT;
	
	reg [7:1] COUNT;
	initial COUNT = 7'd1;
		
	always @ (posedge CLK)
		if(en == 1'b1)
			COUNT <= {COUNT[6:1], COUNT[7] ^ COUNT[1]};
		else
			COUNT <= COUNT;
		
endmodule
	