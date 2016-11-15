# Experiment VERI: FPGA Design with Verilog (Part 1)
In this experiment we will be programming a Cyclone V FPGA from Altera on a DE1-SoC Board that was made by Terasica. We will be using verilog in Quartus II to program the FPGA. 

## Experiment 1: Schematic capture using Quartus II -- 7-Segment Display
We first downloaded the solution for Exercise 1 and tried programming the FPGA using the Programmer from Quartus. The software didn't detect the DE1-SoC board and we had to turn it off and on again for the DE-SOC [USB-1] to appear. After we then added the right type of FPGA to the project (5CSEMA5) and deleted the ARM processor from the programmer window (SOCVHPS) we were able to add the solution to the FPGA and download it onto the board.

We then used the truth table for the 7-Segment Decoder to create the K-map for the output number 4, so that we can extract the Sum of Products form from the K-map. We then added the missing output to the incomplete block diagram.

![Output 4](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/ex1Schematic.PNG)

We then created a new block diagram, and made a symbol file for the 7-Segment Decoder, so that we can include it in this block diagram. We then made this block diagram our top-level design.

![ex1 top-level design](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/Ex1BDF.PNG)

We then compiled the Quartus project to see if there are any errors in the files, and then we added the pin assignments using the Pin Planner

![Pin Planner](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/PinPlannerEx1.PNG)


