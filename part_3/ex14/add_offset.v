module add_offset(keys, tick, address);

	input [9:0] keys;
	input tick;
	output [9:0] address;
	
	reg [9:0] address;
	
	initial address = 10'b0;

	always @ (posedge tick)
		address = keys + address;

endmodule