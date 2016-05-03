`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:41 04/29/2016 
// Design Name: 
// Module Name:    IOB 
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
module IOB(
	output[7:0] Dout,
	inout[7:0] Dbus,
	input[7:0] Din,
	input InEn
    );
	assign Dbus = (InEn) ? Din:8'hzz;
	assign Dout = (InEn) ? Dout:Dbus;

endmodule
