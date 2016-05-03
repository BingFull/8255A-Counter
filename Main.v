`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:02 04/29/2016 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
	inout[7:0] D,
	inout[7:0] PA,
	inout[7:0] PB,
	inout[7:0] PC,
	input reset,
	input nRD,
	input nWR,
	input[1:0] A,
	input nCS
   );
	
	 // between core and iobD
	 wire[7:0] Din;
	 wire[7:0] Dout;
	 wire DEn;
	 // between core and iobA
	 wire[7:0] PAin;
	 wire[7:0] PAout;
	 wire PAEn;
	 // between core and iobB
	 wire[7:0] PBin;
	 wire[7:0] PBout;
	 wire PBEn;
	 // between core and iobC
	 wire[7:0] PCin;
	 wire[7:0] PCout;
	 wire[7:0] PCEn; 
	 
	 IOB iobD(
	 .Dbus(D),
	 .Dout(Din),
	 .Din(Dout),
	 .InEn(DEn)
	 );
	 
	 IOB iobA(
	 .Dbus(PA),
	 .Dout(PAin),
	 .Din(PAout),
	 .InEn(PAEn)
	 );
	 
	 IOB iobB(
	 .Dbus(PB),
	 .Dout(PBin),
	 .Din(PBout),
	 .InEn(PBEn)
	 );
	 
	 IOB1 iobC(
	 .Dbus(PC),
	 .Dout(PCin),
	 .Din(PCout),
	 .InEn(PCEn)
	 );
	 
	 Core core(
	 .reset(reset),
	 .nRD(nRD),
	 .nWR(nWR),
	 .A(A),
	 .nCS(nCS),
	 .Din(Din),
	 .Dout(Dout),
	 .DEn(DEn),
	 .PAout(PAout),
	 .PAin(PAin),
	 .PAEn(PAEn),
	 .PBout(PBout),
	 .PBin(PBin),
	 .PBEn(PBEn),
	 .PCout(PCout),
	 .PCin(PCin),
	 .PCEn(PCEn)
	 );

endmodule
