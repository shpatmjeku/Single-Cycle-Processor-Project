`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: AND
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


// and edhe pse o built in primitive..
module AND(
    input A,
    input B,
    output reg rez
);

always @* begin
    case({A,B})
        2'b00: rez = 1'b0;
        2'b01: rez = 1'b0;
        2'b10: rez = 1'b0;
        2'b11: rez = 1'b1;
    endcase
end

endmodule
