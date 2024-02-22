`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: mux8ne1
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


module mux8ne1(
    input Hyrja0,
    input Hyrja1,
    input Hyrja2,
    input Hyrja3,
    input Hyrja4,
    input Hyrja5,
    input Hyrja6,
    input Hyrja7,
    input [2:0] Sel,
    output reg Dalja
);
       
   always @* begin
     case(Sel)
        3'b000: Dalja = Hyrja0;
        3'b001: Dalja = Hyrja1;
        3'b010: Dalja = Hyrja2;
        3'b011: Dalja = Hyrja3;
        3'b100: Dalja = Hyrja4; 
    endcase
    end

endmodule
