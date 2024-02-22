`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
input wire[15:0] PCAddress,
output wire[15:0] Instruction);

reg[7:0] instrMem[0:127];

initial
$readmemb("InstructionMemory.mem", instrMem);

assign Instruction[15:8] = instrMem[PCAddress];
assign Instruction[7:0] = instrMem[PCAddress + 16'd1];


endmodule
