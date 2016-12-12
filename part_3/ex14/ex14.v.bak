module ex13(CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

	input CLOCK_50;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
	
	wire load;
	wire [9:0] data, count;
	
	tick_5000 t(CLOCK_50, load);
	
	counter_10 c(CLOCK_50, load, count);
	
	ROM r(count, CLOCK_50, data);
	
	spi2dac s(CLOCK_50, data, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm p(CLOCK_50, data, load, PWM_OUT);
	
endmodule