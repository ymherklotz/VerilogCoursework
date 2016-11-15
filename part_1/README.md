# Experiment VERI: FPGA Design with Verilog (Part 1)
In this experiment we will be programming a Cyclone V FPGA from Altera on a DE1-SoC Board that was made by Terasica. We will be using verilog in Quartus II to program the FPGA. 

## Experiment 1: Schematic capture using Quartus II -- 7-Segment Display
We first downloaded the solution for Exercise 1 and tried programming the FPGA using the Programmer from Quartus. The software didn't detect the DE1-SoC board and we had to turn it off and on again for the DE-SOC [USB-1] to appear. After we then added the right type of FPGA to the project (5CSEMA5) and deleted the ARM processor from the programmer window (SOCVHPS) we were able to add the solution to the FPGA and download it onto the board.

We then used the truth table for the 7 Segment Decoder to create the K-map for the output number 4, so that we can extract the PoS 
