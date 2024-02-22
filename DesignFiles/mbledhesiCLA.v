`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: mbledhesiCLA
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


// carry look ahead per program counter $$
module mbledhesiCLA(
    input [15:0] A,
    input [15:0] B,
    input CIN,
    output [15:0] S
    );
    
  //ngjajshem si nliber cla 4 bit shendrruar ne 16bit (faqe 420/421)
  
    wire g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15;
    wire p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15;
    wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14;
    
      and (g0, A[0], B[0]), (g1, A[1], B[1]), (g2, A[2], B[2]), (g3, A[3], B[3]),
        (g4, A[4], B[4]), (g5, A[5], B[5]), (g6, A[6], B[6]), (g7, A[7], B[7]),
        (g8, A[8], B[8]), (g9, A[9], B[9]), (g10, A[10], B[10]), (g11, A[11], B[11]),
        (g12, A[12], B[12]), (g13, A[13], B[13]), (g14, A[14], B[14]), (g15, A[15], B[15]);

    xor (p0, A[0], B[0]), (p1, A[1], B[1]), (p2, A[2], B[2]), (p3, A[3], B[3]),
        (p4, A[4], B[4]), (p5, A[5], B[5]), (p6, A[6], B[6]), (p7, A[7], B[7]),
        (p8, A[8], B[8]), (p9, A[9], B[9]), (p10, A[10], B[10]), (p11, A[11], B[11]),
        (p12, A[12], B[12]), (p13, A[13], B[13]), (p14, A[14], B[14]), (p15, A[15], B[15]);

  
    xor (S[0], p0, CIN),
        (S[1], p1, c0),
        (S[2], p2, c1),
        (S[3], p3, c2),
        (S[4], p4, c3),
        (S[5], p5, c4),
        (S[6], p6, c5),
        (S[7], p7, c6),
        (S[8], p8, c7),
        (S[9], p9, c8),
        (S[10], p10, c9),
        (S[11], p11, c10),
        (S[12], p12, c11),
        (S[13], p13, c12),
        (S[14], p14, c13),
        (S[15], p15, c14);

   
assign c0 = g0 | (p0 & CIN),
       c1 = g1 | (p1 & g0) | (p1 & p0 & CIN),
       c2 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & CIN),
       c3 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & CIN),
       c4 = g4 | (p4 & g3) | (p4 & p3 & g2) | (p4 & p3 & p2 & g1) | (p4 & p3 & p2 & p1 & g0) | (p4 & p3 & p2 & p1 & p0 & CIN),
       c5 = g5 | (p5 & g4) | (p5 & p4 & g3) | (p5 & p4 & p3 & g2) | (p5 & p4 & p3 & p2 & g1) | (p5 & p4 & p3 & p2 & p1 & g0) | (p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c6 = g6 | (p6 & g5) | (p6 & p5 & g4) | (p6 & p5 & p4 & g3) | (p6 & p5 & p4 & p3 & g2) | (p6 & p5 & p4 & p3 & p2 & g1) | (p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c7 = g7 | (p7 & g6) | (p7 & p6 & g5) | (p7 & p6 & p5 & g4) | (p7 & p6 & p5 & p4 & g3) | (p7 & p6 & p5 & p4 & p3 & g2) | (p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c8 = g8 | (p8 & g7) | (p8 & p7 & g6) | (p8 & p7 & p6 & g5) | (p8 & p7 & p6 & p5 & g4) | (p8 & p7 & p6 & p5 & p4 & g3) | (p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c9 = g9 | (p9 & g8) | (p9 & p8 & g7) | (p9 & p8 & p7 & g6) | (p9 & p8 & p7 & p6 & g5) | (p9 & p8 & p7 & p6 & p5 & g4) | (p9 & p8 & p7 & p6 & p5 & p4 & g3) | (p9 & p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c10 = g10 | (p10 & g9) | (p10 & p9 & g8) | (p10 & p9 & p8 & g7) | (p10 & p9 & p8 & p7 & g6) | (p10 & p9 & p8 & p7 & p6 & g5) | (p10 & p9 & p8 & p7 & p6 & p5 & g4) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & g3) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c11 = g11 | (p11 & g10) | (p11 & p10 & g9) | (p11 & p10 & p9 & g8) | (p11 & p10 & p9 & p8 & g7) | (p11 & p10 & p9 & p8 & p7 & g6) | (p11 & p10 & p9 & p8 & p7 & p6 & g5) | (p11 & p10 & p9 & p8 & p7 & p6 & p5 & g4) | (p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & g3) | (p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c12 = g12 | (p12 & g11) | (p12 & p11 & g10) | (p12 & p11 & p10 & g9) | (p12 & p11 & p10 & p9 & g8) | (p12 & p11 & p10 & p9 & p8 & g7) | (p12 & p11 & p10 & p9 & p8 & p7 & g6) | (p12 & p11 & p10 & p9 & p8 & p7 & p6 & g5) | (p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & g4) | (p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & g3) | (p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c13 = g13 | (p13 & g12) | (p13 & p12 & g11) | (p13 & p12 & p11 & g10) | (p13 & p12 & p11 & p10 & g9) | (p13 & p12 & p11 & p10 & p9 & g8) | (p13 & p12 & p11 & p10 & p9 & p8 & g7) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & g6) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & g5) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & g4) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & g3) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN),
       c14 = g14 | (p14 & g13) | (p14 & p13 & g12) | (p14 & p13 & p12 & g11) | (p14 & p13 & p12 & p11 & g10) | (p14 & p13 & p12 & p11 & p10 & g9) | (p14 & p13 & p12 & p11 & p10 & p9 & g8) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & g7) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & g6) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & g5) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & g4) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & g3) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p14 & p13 & p12 & p11 & p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & CIN);

    
endmodule


