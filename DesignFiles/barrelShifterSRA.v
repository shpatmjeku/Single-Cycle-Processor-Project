`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: barrelShifterSRA
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


module barrelShifterSRA(
    input [15:0] data, 
    input [3:0] shamt, 
    output reg [15:0] result
);

    wire [15:0] stage1, stage2, stage3, stage4;

    wire signBit = data[15];

    assign stage1 = shamt[0] ? {{1{signBit}}, data[15:1]} : data;
    assign stage2 = shamt[1] ? {{2{signBit}}, stage1[15:2]} : stage1;
    assign stage3 = shamt[2] ? {{4{signBit}}, stage2[15:4]} : stage2;
    assign stage4 = shamt[3] ? {{8{signBit}}, stage3[15:8]} : stage3;

    always @* begin
        result = stage4;
    end

endmodule
