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
	 assign PAout = 8'b00000000;
	 assign PBout = 8'b00000000;
	 assign PCout = 8'b00000000;
	 assign Dout = 8'b00000000;
	 assign PAEn = 0;
	 assign PBEn = 0;
	 assign PCEn = 8'b00000000;
	 assign PDEn = 0;
	 
	 



endmodule
