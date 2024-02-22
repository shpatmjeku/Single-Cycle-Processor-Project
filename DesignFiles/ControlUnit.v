`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [3:0] OPCODE,  // 4-bit OPCODE
    output reg RegDest,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);


always @ (OPCODE) begin
    case(OPCODE)
        4'b0000:          // AND, OR, XOR
        begin
            RegDest    = 1;
            ALUSrc     = 0;
            MemtoReg   = 0;
            RegWrite   = 1;
            MemRead    = 0;
            MemWrite   = 0;
            ALUOp[1]   = 1;
            ALUOp[0]   = 0;
            Branch     = 0;
       
        end
        
        4'b0001:          // ADD, SUB
        begin
            RegDest    = 1;
            ALUSrc     = 0;
            MemtoReg   = 0;
            RegWrite   = 1;
            MemRead    = 0;
            MemWrite   = 0;
            ALUOp[1]   = 1;
            ALUOp[0]   = 0;
            Branch     = 0;
        end
        
         4'b1001:        // ADDI
        begin
            RegDest    = 0;
            ALUSrc     = 1;
            MemtoReg   = 0;
            RegWrite   = 1;
            MemRead    = 0;
            MemWrite   = 0;
            ALUOp[1]   = 1;
            ALUOp[0]   = 1;
            Branch     = 0;
        end
        
        4'b1010:         // SUBI
        begin
            RegDest    = 0;
            ALUSrc     = 1;
            MemtoReg   = 0;
            RegWrite   = 1;
            MemRead    = 0;
            MemWrite   = 0;
            ALUOp[1]   = 1;
            ALUOp[0]   = 1;
            Branch     = 0;
        end
        
        4'b1011:           // SLTI
        begin
            RegDest    = 0;
            ALUSrc     = 1;
            MemtoReg   = 0;
            RegWrite   = 1;
            MemRead    = 0;
            MemWrite   = 0;
            ALUOp[1]   = 1;
            ALUOp[0]   = 1;
            Branch     = 0;
        end
       

        4'b1100:           // LW
        begin
            RegDest    = 0;
            ALUSrc     = 1;
            MemtoReg   = 1;
            RegWrite   = 1;
            MemRead    = 1;
            MemWrite   = 0;
            ALUOp[1]   = 0;
            ALUOp[0]   = 0;
            Branch     = 0;
        end

        4'b1101:           // SW
        begin
            RegDest    = 0;
            ALUSrc     = 1;
            MemtoReg   = 0;
            RegWrite   = 0;
            MemRead    = 0;
            MemWrite   = 1;
            ALUOp[1]   = 0;
            ALUOp[0]   = 0;
            Branch     = 0;
        end

        4'b1111:           // BEQ
        begin
            RegDest    = 0;
            ALUSrc     = 0;
            MemtoReg   = 0;
            RegWrite   = 0;
            MemRead    = 0;
            MemWrite   = 0;
            ALUOp[1]   = 0;
            ALUOp[0]   = 1;
            Branch     = 1;
        end
        4'b0010:           // SLL SRA
        begin
            RegDest    = 1;
            ALUSrc     = 1'bz;
            MemtoReg   = 0;
            RegWrite   = 1;
            MemRead    = 0;
            MemWrite   = 0;
            ALUOp[1]   = 1;
            ALUOp[0]   = 0;
            Branch     = 0;
        end   
    endcase
end

endmodule
