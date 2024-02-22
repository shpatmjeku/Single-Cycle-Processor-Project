`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: barrelShifterSLL
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


module barrelShifterSLL(
  input [15:0] data, 
  input [3:0] shamt, 
  output reg [15:0] result

);


    wire [15:0] stage1, stage2, stage3, stage4;


    assign stage1 = shamt[0] ? {data[14:0], 1'b0} : data;
    assign stage2 = shamt[1] ? {stage1[13:0], 2'b00} : stage1;
    assign stage3 = shamt[2] ? {stage2[11:0], 4'b0000} : stage2;
    assign stage4 = shamt[3] ? {stage3[7:0], 8'b00000000} : stage3;

    always @* begin
        result = stage4;
    end

endmodule
