`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:34 04/29/2016 
// Design Name: 
// Module Name:    Core 
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
module Core(
	output[7:0] PAout,
	output[7:0] PBout,
	output[7:0] PCout,
	output[7:0] Dout,
	output PAEn,
	output PBEn,
	output[7:0] PCEn,
	output DEn,
	input reset,
	input nRD,
	input nWR,
	input[1:0] A,
	input nCS,
	input[7:0] PAin,
	input[7:0] PBin,
	input[7:0] PCin,
	input[7:0] Din
    );
	
	wire[6:0] CtrlData;
	wire[3:0] DoutSelect;
	wire PAInLd;
	wire PAOutLd;
	wire PBInLd;
	wire PBOutLd;
	wire[7:0] PCOutLd;
	wire[7:0] PCStatus;

	assign reset = (nCS)?1'b1:rst;;
	
	//实例化
	CtrlLogic Ctrl(
		.PAEn(PAEn),
		.PBEn(PBEn),
		.PCEn(PCEn),
		.DEn(DEn),
		.CtrlData(CtrlData),
		.DoutSelect(DoutSelect),
		.PAInLd(PAInLd),
		.PAOutLd(PAOutLd),
		.PBInLd(PBInLd),
		.PBOutLd(PBOutLd),
		.PCOutLd(PCOutLd),
		.reset(reset),
		.nRD(nRD),
		.nWR(nWR),
		.A(A),
		.nCS(nCS),
		.Din(Din),
		.PCin(PCin)
	);
	
	DoutMux DM(
		.Dout(Dout),
		.DoutSelect(DoutSelect),
		.PAInBuf(PAInBuf),
		.PAin(PAin),
		.PBInBuf(PBInBuf),
		.PBin(PBin),
    	.PCStatus(PCStatus)
	)
	 
	 



endmodule
