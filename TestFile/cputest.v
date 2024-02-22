`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Shpat Mjeku
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: cputest
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


module cputest();


reg Clock;

integer i;
initial
begin
  for(i=0; i < 60; i=i+1) //30x nderro nga Clock 0 - 1, 30 tehe pozitive
begin
#10 Clock = 0;
#10 Clock = 1;
end

#10 $finish;
end



CPU cpu16(Clock);
endmodule

