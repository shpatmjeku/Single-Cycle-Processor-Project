`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: alu1bit
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


module alu1bit(
    input A,
    input B,
    input CIN,
    input BInvert, 
    input Less,
    input [2:0] Op, 
    output Result,
    output CarryOut
);

    wire JoB, B_mux, mbledhesiTeli, and_teli, or_teli, xor_teli;
    
    assign JoB = ~B;
    mux2ne1 B_mux2to1(B, JoB, BInvert, B_mux);
  
    AND andf(A, B_mux, and_teli);
    OR orf(A, B_mux, or_teli);
    XOR xorf(A, B_mux, xor_teli);
    mbledhesi m1(A, B_mux, CIN, mbledhesiTeli, CarryOut);

    mux8ne1 MuxiKryesor(
        .Hyrja0(and_teli),           // AND
        .Hyrja1(Less),               // SLTI
        .Hyrja2(or_teli),            // OR
        .Hyrja3(xor_teli),           // XOR
        .Hyrja4(mbledhesiTeli),      // ADD, ADDI, SUB, SUBI
        .Hyrja5(1'b0),               // Sll eshte implementuar ne alu16bit
        .Hyrja6(1'b0),               // Sra eshte implementuar ne alu16bit
        .Hyrja7(1'b0),               // Unused
        .Sel(Op),
        .Dalja(Result)
    );
endmodule

