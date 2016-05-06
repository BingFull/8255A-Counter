`timescale 1ns / 1ps

module PBOut(
    output[7:0] PBOut,  //口B输出信号
    input reset,
    input PBOutLd,  //口B输出使能信号
    input[7:0] Din
);

    reg[7:0] PBOutQ;  //口B输出锁存器Q端
    reg[7:0] PBOutD;  //口B输出锁存器D端
    assign PBOut = PBOutQ;  //口B输出锁存器Q端连接B口输出
    
    always @(PBOutLd or Din) begin
      if(PBOutLd==1'b0)
        PBOutD = Din;  //输出使能信号有效，缓冲输出数据
      else
        PBOutD = PBOutQ;  //输出使能信号无效，锁存输出数据
    end
    
    always @(reset or PBOutLd or Din) begin
      if(reset)
        PBOutQ = 8'h00;
      else
        PBOutQ = PBOutD;
    end
    
endmodule