# Experiment VERI: FPGA Design with Verilog (Part 1)

In this experiment we will be programming a Cyclone V FPGA from Altera on a DE1-SoC Board that was made by Terasica. We will be using verilog in Quartus II to program the FPGA. 


## Experiment 1: Schematic capture using Quartus II -- 7-Segment Display

We first downloaded the solution for Exercise 1 and tried programming the FPGA using the Programmer from Quartus. The software didn't detect the DE1-SoC board and we had to turn it off and on again for the DE-SOC [USB-1] to appear. After we then added the right type of FPGA to the project (5CSEMA5) and deleted the ARM processor from the programmer window (SOCVHPS) we were able to add the solution to the FPGA and download it onto the board.

We then used the truth table for the 7-Segment Decoder to create the K-map for the output number 4, so that we can extract the Sum of Products form from the K-map. We then added the missing output to the incomplete block diagram.

![Output 4](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/ex1Schematic.PNG)

We then created a new block diagram, and made a symbol file for the 7-Segment Decoder, so that we can include it in this block diagram. We then made this block diagram our top-level design. This is the file that will make the whole project work on the FPGA and will be programmed onto the FPGA. The other file is just a schematic file that describes how the block in the top level design works.

![ex1 top-level design](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/Ex1BDF.PNG)

We then compiled the Quartus project to see if there are any errors in the files, and then we added the pin assignments using the Pin Planner.

![Pin Planner](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/PinPlannerEx1.PNG)

Finally we compiled the project and downloaded it onto the FPGA and it worked like the solution. Using the block diagram to create the project took a lot of time though and it would have been much easier to make the project in Verilog as it would have taken much less time and effort. We also wouldn't have had to create the Karnaugh maps to simplify the design and be able to implement it in the block diagram, because in Verilog we only need to implement the truth table. It is also much quicker to type than drag the wires from logic element to logic element and trying to find the different logic elements in the list of IPs that come with Quartus II. Verilog is also much more flexible, as we can define the 7-Segment Decoder in different ways (behaviourly or structurally). 


### Propagation Delays from inputs to outputs

To analyze the propagation delays from inputs to outputs we used the TimeQuest Timing Analyzer to create a table that contains all the propagation delays of all the inputs and outputs. First we looked at the propagation delay under the conditions "Slow 1100mV 0°C". This gave the following table.

__Slow 1100mV 0°C TimeQuest Timing Analyzer Table__

![0 degrees timing](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/RiseAndFall0degree.PNG)


Then for the second table we used the "Slow 1100mV 85°C" TimeQuest Analysis and got a slightly different table from it.


__Slow 1100mV 85°C TimeQuest Timing Analyzer Table__

![85 degrees timing](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex1/RiseAndFall85degree.PNG)


From these two tables we can 
