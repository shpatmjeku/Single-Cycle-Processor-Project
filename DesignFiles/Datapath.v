`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 
// Design Name: 
// Module Name: Datapath
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


module Datapath(
input Clock,                 //HYRJE NGA CPU - TELI CPU_IN_1
input RegDst, 
input Branch, 
input MemRead, 
input MemWrite, 
input RegWrite, 
input MemToReg, 
input ALUSrc,                //HYRJET NGA CU - TELAT CU_OUT_x
input [1:0] ALUOp,           //HYRJE NGA  CU - TELAT CU_OUT_x
output [3:0] opcode          //DALJE PER NE CU - TELI D_OUT_1
);


reg  [15:0]  pc_initial;       // REG PC
wire [15:0]  pc_next;          // TELI: T1
wire [15:0]  pc2;              // TELI: T2
wire [15:0]  instruction;      // TELI: T3
wire [1:0]   mux_regfile;      // TELI: T4
wire [15:0]  readData1;        // TELI: T5
wire [15:0]  readData2;        // TELI: T6
wire [15:0]  writeData;        // TELI: T7  
wire [15:0]  mux_ALU;          // TELI: T8
wire [15:0]  ALU_Out;          // TELI: T9
wire [15:0]  Zgjerimi;         // TELI: T10
wire [15:0]  memToMux;         // TELI: T11
wire [15:0]  shifter2beq;      // TELI: T12
wire [15:0]  beqAddress;       // TELI: T13
wire [3:0]   ALUCtrl;          // TELI: T14

wire zerof;                    // TELI: T15
wire overflow;                 // TELI: T16
wire carryout;                 // TELI: T17
wire andMuxBranch;             // TELI: T18

initial
begin
    pc_initial = 16'd10;      //inicializimi fillesatar i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next;    //azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
end
  
//TELI T2 - Program counteri rritet per 2 byte per te gjitha instruksionet perveq beq - assign pc2 = pc_initial + 2; 
 mbledhesiCLA rritePer2Byte(pc_initial, 16'b0000000000000010, 1'b0, pc2);


//TELI 12 - pergatitja e adreses per kercim ne BEQ (7 bit si MSB, 8 bit nga pjesa imediate, 1 bit shtyrje majtas qe dmth x2 se na i kem instruksionet 2 byte)
assign shifter2beq = {{7{instruction[7]}}, instruction[7:0], 1'b0};

//Instr mem //inicializimi i IM (PC adresa hyrje, teli T3 instruction si dajle)
InstructionMemory IM(pc_initial, instruction);
  
//T4 - Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I-formati) - MUX M1 ne foto
//                                            RD                         RT
//assign mux_regfile = (RegDst == 1'b1) ? instruction[7:6] : instruction[9:8];
  mux2n1_2bit M1(
    .hyrja0(instruction[9:8]), 
    .hyrja1(instruction[7:6]), 
    .Sel(RegDst),              
    .Dalja(mux_regfile)        
);

  //T10 - Zgjerimi nga 8 ne 16 bit - 8 bit si MSB dhe pjesa e instruction[7:0] - S1 ne foto
assign Zgjerimi = {{8{instruction[7]}}, instruction[7:0]};  

//REGFILE
//inicializimi i RegisterFile(RS, RT, T4, T7, CU_OUT_x, CPU_IN_1, T5, T6)
RegisterFile RF(instruction[11:10], instruction[9:8], mux_regfile, writeData, RegWrite, Clock, readData1, readData2 ); 

// T8 - Percaktimi nese hyrja e MUX-it M2 para ALU eshte Regjstri 2 i RF apo vlera imediate e instruksionit 
//assign mux_ALU = (ALUSrc == 1'b1) ? Zgjerimi : readData2;
   mux2n1_16bit M2(
     .hyrja0(readData2), 
     .hyrja1(Zgjerimi), 
     .Sel(ALUSrc),              
     .Dalja(mux_ALU)        
);

//inicializimi i ALU Control (CU_OUT_x, Function Code nga R-formati, Opcode, T14)  
ALUControl AC(ALUOp, instruction[1:0], instruction[15:12], ALUCtrl); 

//inicializimi i ALU (T5, T8, T14[3], T14[2:0], T15, T9, T16, T17)
  alu16bit ALU(readData1, mux_ALU, ALUCtrl[3], ALUCtrl[2:0],instruction[5:2], zerof, ALU_Out, overflow, carryout);

//inicializimi i Data Memory (T9, 6, CU_OUT_x, CU_OUT_x, CPU_IN_1, T11) 
DataMemory DM(ALU_Out, readData2, MemWrite, MemRead, Clock, memToMux);

//T7 - Teli qe i dergon te dhenat nga MUX - M3 ne Regfile
//assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;
  mux2n1_16bit M3(
     .hyrja0(ALU_Out), 
     .hyrja1(memToMux), 
     .Sel(MemToReg),              
     .Dalja(writeData)        
);


 //T18 - Teli qe del nga porta DHE (shikon nese plotesohet kushti per BEQ)
assign andMuxBranch = zerof & Branch;

//T13, Teli qe mban adresen ne te cilen do te kercej programi kur kushti BEQ plotesohet
//assign beqAddress = pc2 + shifter2beq;
mbledhesiCLA rritePerSaInstruksione(pc2, shifter2beq, 1'b0, beqAddress);


//T1 - Teli qe del nga Mux M4 ne foto qe kontrollon nese kemi BEQ apo PC+2
//assign pc_next = (andMuxBranch == 1'b1) ? beqAddress : pc2;
mux2n1_16bit M4(
     .hyrja0(pc2), 
     .hyrja1(beqAddress), 
     .Sel(andMuxBranch),              
     .Dalja(pc_next)        
);

//Teli D_OUT_1 qe i dergohet CU
assign opcode = instruction[15:12];

endmodule
