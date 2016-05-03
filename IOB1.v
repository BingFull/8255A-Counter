`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:03 04/29/2016 
// Design Name: 
// Module Name:    IOB1 
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
module IOB1(
	output[7:0] Dout,
	inout[7:0] Dbus,
	input[7:0] Din,
	input[7:0] InEn
    );
	assign Dout = 8'b00000000;
	assign Dbus = 8'b00000000;

endmodule
