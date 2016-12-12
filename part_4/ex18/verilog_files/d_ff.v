module d_ff(clk, in, out);

	input clk, in;
	output out;
	wire in;
	reg out;

	always @ (posedge clk)
		out <= in;

endmodule