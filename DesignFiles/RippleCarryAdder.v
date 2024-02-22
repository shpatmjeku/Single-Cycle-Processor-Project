`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: RippleCarryAdder
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


module RippleCarryAdder(
  input [15:0] A,
  input [15:0] B,
  input CIN,
  output [15:0]Sum,
  output Overflow 

    );

  wire [15:0] carry;
    
 mbledhesi inst0(A[0], B[0], CIN, Sum[0], carry[0]);
 mbledhesi inst1(A[1], B[1], carry[0], Sum[1], carry[1]);
 mbledhesi inst2(A[2], B[2], carry[1], Sum[2], carry[2]);
 mbledhesi inst3(A[3], B[3], carry[2], Sum[3], carry[3]);
 mbledhesi inst4(A[4], B[4], carry[3], Sum[4], carry[4]);
 mbledhesi inst5(A[5], B[5], carry[4], Sum[5], carry[5]);
 mbledhesi inst6(A[6], B[6], carry[5], Sum[6], carry[6]);
 mbledhesi inst7(A[7], B[7], carry[6], Sum[7], carry[7]);
 mbledhesi inst8(A[8], B[8], carry[7], Sum[8], carry[8]);
 mbledhesi inst9(A[9], B[9], carry[8], Sum[9], carry[9]);
 mbledhesi inst10(A[10], B[10], carry[9], Sum[10], carry[10]);
 mbledhesi inst11(A[11], B[11], carry[10], Sum[11], carry[11]);
 mbledhesi inst12(A[12], B[12], carry[11], Sum[12], carry[12]);
 mbledhesi inst13(A[13], B[13], carry[12], Sum[13], carry[13]);
 mbledhesi inst14(A[14], B[14], carry[13], Sum[14], carry[14]);
 mbledhesi inst23(A[15], B[15], carry[14], Sum[15], carry[15]);  
  
  assign Overflow = carry[14] ^ carry[15];
    
endmodule
