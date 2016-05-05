`timescale 1ns / 1ps

module PBIN(
	output[7:0] PBInBuf,  //口B输入寄存器
	input reset,
    input[7:0] PBIn;  //口B输入信号
    input PBInLd;   //口B输入使能信号
    );
    
    reg[7:0] PBInBufQ;  //口B输入锁存器Q端
    reg[7:0] PBInBufD;  //口B输入锁存器D端
    assign PBInBuf = PBInBufQ;  //口B输入锁存器Q端连接B口输入
    
    always @(PBInLd or PBIn) begin
      if(PBInLd==1'b0)
        PBInBufD = PBIn;  //输入使能信号有效，缓冲输入数据
      else  
        PBInBufD = PBInBufQ;  //输入使能信号无效，锁存输入数据
    end
    
    always @(reset or PBInLd or PBIn) begin  //该块产生锁存器
      if(reset)
        PBInBufQ = 8'h00;  //复位，清0
      else
        PBInBufQ = PBInBufD;
    end
    
endmodule