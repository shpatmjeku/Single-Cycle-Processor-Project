`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU( input Clock);

wire[3:0] opcode;
wire RegDst;  
wire Branch; 
wire MemRead; 
wire MemWrite;
wire RegWrite;
wire MemToReg; 
wire ALUSrc;
wire [1:0] ALUOp;


Datapath DP (Clock, RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc, ALUOp, opcode);

ControlUnit CU(opcode, RegDst, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite);


endmodule
