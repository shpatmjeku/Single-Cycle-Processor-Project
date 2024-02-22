`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: mux2n1_16bit
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


module mux2n1_16bit(
    input [15:0] hyrja0,
    input [15:0] hyrja1,
    input Sel,
    output reg [15:0] Dalja
);

always @* begin
    case(Sel)
        1'b0: Dalja = hyrja0;
        1'b1: Dalja = hyrja1;
    endcase
end

endmodule
