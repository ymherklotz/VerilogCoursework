module ex14(CLOCK_50, SW, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT, HEX0, HEX1, HEX2, HEX3, HEX4);

	input CLOCK_50;
	input [9:0] SW;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	
	wire load;
	wire [9:0] data;
	wire [9:0] address;
	wire [23:0] freq_tmp;
	wire [19:0] freq_fin;
	
	tick_5000 tick(CLOCK_50, load);
	
	add_offset fin_address(SW, load, address);
	
	ROM rom(address, CLOCK_50, data);
	
	spi2dac dac(CLOCK_50, data, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm p(CLOCK_50, data, load, PWM_OUT);
	
	const_mult mult(SW, freq_tmp);
	
	bin2bcd_16 bcd(freq_tmp[23:10], freq_fin[3:0], freq_fin[7:4], freq_fin[11:8], freq_fin[15:12], freq_fin[19:16]);
	
	hex_to_7seg h0(HEX0, freq_fin[3:0]);	
	hex_to_7seg h1(HEX1, freq_fin[7:4]);
	hex_to_7seg h2(HEX2, freq_fin[11:8]);
	hex_to_7seg h3(HEX3, freq_fin[15:12]);
	hex_to_7seg h4(HEX4, freq_fin[19:16]);
	
endmodule