module ex11(CLOCK_50, SW, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

	input CLOCK_50;
	input [9:0] SW;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
	
	wire load;
	
	tick_5000 t(CLOCK_50, load);
	spi2dac s(CLOCK_50, SW, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm p(CLOCK_50, SW, load, PWM_OUT);
	
endmodule