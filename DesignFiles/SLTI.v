`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: SLTI
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


module SLTI (
  input [15:0] A, 
  input [15:0] B, 
  output rezultatiSLTI 
);
  
  wire [15:0] Bnegative, rez;
  
  assign Bnegative = ~B;
  RippleCarryAdder zbriti(A,Bnegative,1'b1, rez, overflow);
  
  wire  overflow;
  
  assign rezultatiSLTI = overflow ^ rez[15];
  
endmodule
