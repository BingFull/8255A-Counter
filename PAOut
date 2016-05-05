`timescale 1ns / 1ps

module PAOut(
    output[7:0] PAOut;  //口A输出信号
    input reset;
    input PAOutLd;  //口A输出使能信号
    input[7:0] Din;
);

    reg[7:0] PAOutQ;  //口A输出锁存器Q端
    reg[7:0] PAOutD;  //口A输出锁存器D端
    assign PAOut = PAOutQ;  //口A输出锁存器Q端连接A口输出
    
    always @(PAOutLd or Din) begin
      if(PAOutLd==1'b0)
        PAOutD = Din;  //输出使能信号有效，缓冲输出数据
      else
        PAOutD = PAOutQ;  //输出使能信号无效，锁存输出数据
    end
    
    always @(reset or PAOutLd or Din) begin
      if(reset)
        PAOutQ = 8'h00;
      else
        PAOutQ = PAOutD;
    end
    
endmodule