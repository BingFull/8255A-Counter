`timescale 1ns / 1ps

module PAIN(
	output[7:0] PAInBuf,  //口A输入寄存器
	input reset,
    input[7:0] PAIn;  //口A输入信号
    input PAInLd;   //口A输入使能信号
    );
    
    reg[7:0] PAInBufQ;  //口A输入锁存器Q端
    reg[7:0] PAInBufD;  //口A输入锁存器D端
    assign PAInBuf = PAInBufQ;  //口A输入锁存器Q端连接A口输入
    
    always @(PAInLd or PAIn) begin
      if(PAInLd==1'b0)
        PAInBufD = PAIn;  //输入使能信号有效，缓冲输入数据
      else  
        PAInBufD = PAInBufQ;  //输入使能信号无效，锁存输入数据
    end
    
    always @(reset or PAInLd or PAIn) begin  //该块产生锁存器
      if(reset)
        PAInBufQ = 8'h00;  //复位，清0
      else
        PAInBufQ = PAInBufD;
    end
    
endmodule