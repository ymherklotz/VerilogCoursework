module div_by_2(in, out);

	input signed [9:0] in;
	output signed [9:0] out;
	
	assign out = in >>> 1;
	
endmodule