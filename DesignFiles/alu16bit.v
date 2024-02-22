`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: alu16bit
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


module alu16bit (
    input [15:0] A,
    input [15:0] B,
    input BNegate,
    input [2:0] Op,
    input [3:0] shamt,
    output Zero,
    output reg [15:0] Result,
    output Overflow,
    output CarryOut
);

    wire [14:0] COUT;
    wire [15:0] aResult;
    wire LessThanRslt;
    SLTI perSLTI(A, B, LessThanRslt);
    
    wire [15:0] ResultSLL, ResultSRA;
    
    // Modulet per instruksionet e shtyrjes 
    barrelShifterSLL SLL(A, shamt, ResultSLL);
    barrelShifterSRA SRA(A, shamt, ResultSRA);
    


alu1bit ALU0(A[0], B[0], BNegate, BNegate, LessThanRslt, Op, aResult[0], COUT[0]); 
alu1bit ALU1(A[1], B[1], COUT[0], BNegate, 0, Op, aResult[1], COUT[1]);
alu1bit ALU2(A[2], B[2], COUT[1], BNegate, 0, Op, aResult[2], COUT[2]);
alu1bit ALU3(A[3], B[3], COUT[2], BNegate, 0, Op, aResult[3], COUT[3]);
alu1bit ALU4(A[4], B[4], COUT[3], BNegate, 0, Op, aResult[4], COUT[4]);
alu1bit ALU5(A[5], B[5], COUT[4], BNegate, 0, Op, aResult[5], COUT[5]);
alu1bit ALU6(A[6], B[6], COUT[5], BNegate, 0, Op, aResult[6], COUT[6]);
alu1bit ALU7(A[7], B[7], COUT[6], BNegate, 0, Op, aResult[7], COUT[7]);
alu1bit ALU8(A[8], B[8], COUT[7], BNegate, 0, Op, aResult[8], COUT[8]);
alu1bit ALU9(A[9], B[9], COUT[8], BNegate, 0, Op, aResult[9], COUT[9]);
alu1bit ALU10(A[10], B[10], COUT[9], BNegate, 0, Op, aResult[10], COUT[10]);
alu1bit ALU11(A[11], B[11], COUT[10], BNegate, 0, Op, aResult[11], COUT[11]);
alu1bit ALU12(A[12], B[12], COUT[11], BNegate, 0, Op, aResult[12], COUT[12]);
alu1bit ALU13(A[13], B[13], COUT[12], BNegate, 0, Op, aResult[13], COUT[13]);
alu1bit ALU14(A[14], B[14], COUT[13], BNegate, 0, Op, aResult[14], COUT[14]);
alu1bit ALU15(A[15], B[15], COUT[14], BNegate, 0, Op, aResult[15], CarryOut);
  


    always @(*) begin
        case(Op)
            3'b110: Result = ResultSLL; 
            3'b111: Result = ResultSRA; 
            default: Result = aResult; 
        endcase
      end


  assign Overflow = COUT[14] ^ CarryOut; // overflow 

            // Zero 
      assign Zero = ~(aResult[0] | aResult[1] | aResult[2] | aResult[3] |
                    aResult[4] | aResult[5] | aResult[6] | aResult[7] |
                    aResult[8] | aResult[9] | aResult[10] | aResult[11] |
                    aResult[12] | aResult[13] | aResult[14] | aResult[15]);
      
    
    
endmodule