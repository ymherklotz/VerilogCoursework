# Experiment VERI: FPGA Design with Verilog (Part 1)

In this experiment we will be programming a Cyclone V FPGA from Altera on a DE1-SoC Board that was made by Terasica. We will be using verilog in Quartus II to program the FPGA. 


## Experiment 1: Schematic capture using Quartus II -- 7-Segment Display


### Introduction

We first downloaded the solution for Exercise 1 and tried programming the FPGA using the Programmer from Quartus. The software didn't detect the DE1-SoC board and we had to turn it off and on again for the DE-SOC [USB-1] to appear. After we then added the right type of FPGA to the project (5CSEMA5) and deleted the ARM processor from the programmer window (SOCVHPS) we were able to add the solution to the FPGA and download it onto the board.


### Using Block Diagram

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


The output on these tables shows the propagation delays from the inputs to the outputs. The 4 different rows have 4 different abreviations RR, RF, FR and FF, that stand for Rise-Rise, Rise-Fall, Fall-Rise and Fall-Fall respectively. These describe the time it takes for the signal to travel from a rise or fall of the signal to produce a rise or fall in the output signal. There are some boxes in the table that do not have a time in there, this is because these connections never happen and therefore the FPGA simplifies them and does not even connect them, and therefore they do not have a time. The times are also measured in nanoseconds. 

With the help of these tables we can observe that when the FPGA is at 85°C, the times between the inputs and outputs is higher than when the FPGA is cooled at 0°C. This can be explained by how fast the gates switch due to the transistor voltages switching. The switching time increases as the temperature increases and therefore the time between the inputs and outputs will increase as well.


## Experiment 2: 7-Segment Decoder in Verilog HDL


As modern digital designers do not use schematics anymore to design hardware it is much more useful to learn how to describe the hardware using a Hardware Description Language (HDL) such as VHDL or Verilog HDL. 

We typed the code for the 7-Segment Decoder in Quartus and created the module as shown below.

![7-Segment Decoder Verilog](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex2/hex_to_7seg.PNG)

Then we created a top level design file in Verilog as well. This process is much faster than doing everything using schematics as one can easily edit the file and change parameters easily as well. It is also much easier to get an overview of the project as complicated schematic files are very hard to read. The code for the top level design can be seen below.

![7-Segment Decoder top level](https://github.com/ymherklotz/digital_verilog_coursework/blob/master/Extra/ex2/top_ex2.PNG)

