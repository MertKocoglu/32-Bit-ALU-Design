Summary

This repository contains a Verilog implementation of a 32-bit Arithmetic Logic Unit (ALU). The ALU performs a variety of operations, including bitwise operations, addition/subtraction, and set less than, based on the provided function code.

Module Description

ALU

The ALU module accepts two 32-bit input operands (a and b) and a 3-bit function selector (f) to determine the operation to perform. It outputs a 32-bit result (y) and a zero flag (z) that indicates whether the result is zero.

Inputs:

a: First 32-bit operand (logic [31:0])
b: Second 32-bit operand (logic [31:0])
f: Function selector (logic [2:0]), where:
f[2] determines addition or subtraction (0 for addition, 1 for subtraction)
f[1:0] specifies the operation:
00: Bitwise AND
01: Bitwise OR
10: Addition/Subtraction
11: Set Less Than (SLT)
Outputs:

y: The result of the selected operation (logic [31:0])
z: Zero flag (logic), indicating if the result is zero (1 if y == 0, else 0)
Functionality:

Addition/Subtraction: Uses two's complement for subtraction by inverting b based on the function selector and adding a carry-in.
Bitwise Operations: Performs AND and OR operations on the inputs.
Set Less Than: Returns 1 if a < b, otherwise returns 0.
Usage
To simulate and test the ALU, include it in a Verilog testbench. It can be integrated into a larger processor design or used as a standalone component for various digital logic applications.

License
This project is open source. Feel free to use, modify, and distribute the code.

