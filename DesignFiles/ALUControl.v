`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
    input [1:0] ALUOp,
    input [1:0] Funct,
    input [3:0] OPCODE, 
    output reg [3:0] ALUCtrlTeli
);

always @(ALUOp, Funct, OPCODE) 
begin
    if (ALUOp == 2'b00) begin
      ALUCtrlTeli = 4'b0100; // LW+SW 
    end
    else if (ALUOp == 2'b01) begin
        ALUCtrlTeli = 4'b1100; // BEQ 
    end
    else if (ALUOp == 2'b10) begin // R-Format 
      if (OPCODE == 4'b0000) begin // Kqyre OPCODE 0000 tani Funct
            if (Funct == 2'b00) ALUCtrlTeli = 4'b0000; // AND
            else if (Funct == 2'b01) ALUCtrlTeli = 4'b0010; // OR
            else if (Funct == 2'b10) ALUCtrlTeli = 4'b0011; // XOR
        end
        else if (OPCODE == 4'b0001) begin // Kqyre OPCODE 0001 tani Funct
            if (Funct == 2'b00) ALUCtrlTeli = 4'b0100; // ADD
            else if (Funct == 2'b01) ALUCtrlTeli = 4'b1100; // SUB
        end
        else if (OPCODE == 4'b0010) begin // Kqyre OPCODE 0010 tani Funct
            if (Funct == 2'b00) ALUCtrlTeli = 4'b0110; // SLL
            else if (Funct == 2'b01) ALUCtrlTeli = 4'b0111; // SRA
        end
    end
    else if (ALUOp == 2'b11) begin // I-format, Kqyre OPCODE
            if (OPCODE == 4'b1001) ALUCtrlTeli = 4'b0100; //  ADDI
            else if (OPCODE == 4'b1010) ALUCtrlTeli = 4'b1100; //  SUBI
            else if (OPCODE == 4'b1011) ALUCtrlTeli = 4'b0001; //  SLTI   
    end
end
endmodule
