`timescale 1ns / 1ps

module PCIO(
	output[7:0] PCout,
    output[7:0] PCStatus,
	input reset,
	input nRD,
	input nWR,
	input[1:0] A,
	input[7:0] PCin,
	input[7:0] Din,
    input[6:0] CtrlData,
    input[7:0] PCOutLd
    );
    
    assign PCRS = CtrlData[6];
    assign Flag = CtrlData[5];
    assign ModeA = CtrlData[4:3];
    assign ModeB = CtrlData[2];
    assign PAIO = CtrlData[1];
    assign PBIO = CtrlData[0];
    
    assign nSTBA = PCIn[4];
    assign nSTBB = PCIn[2];
    assign nACKA = PCIn[6];
    assign nACKB = PCIn[2];
    
    always @(reset or Flag or PCoutLd or PCOutD)  //PCOut
        if(reset)
            PCOut = 8'b00000000;  //复位清0
        else
            if(Flag==1'b0)  //置位/复位操作
                case(PCOutLd)
                    8'b11111110: PCOut = {PCOut[7:1],PCRS};
                    8'b11111101: PCOut = {PCOut[7:2],PCRS,PCOut[0]};
                    8'b11111011: PCOut = {PCOut[7:3],PCRS,PCOut[1:0]};
                    8'b11110111: PCOut = {PCOut[7:4],PCRS,PCOut[2:0]};
                    8'b11101111: PCOut = {PCOut[7:5],PCRS,PCOut[3:0]};
                    8'b11011111: PCOut = {PCOut[7:6],PCRS,PCOut[4:0]};
                    8'b10111111: PCOut = {PCOut[7],PCRS,PCOut[5:0]};
                    8'b01111111: PCOut = {PCRS,PCOut[6:0]};
                    default: PCOut = 8'b11111111;
                 endcase
             else
                PCOut = PCOutD;
     
     
     //高位到低位依次处理C口输出数据   
     always @(reset or PCOutLd[7] or nOBFA or Din[7])  //PCOutD[7]
         if(PCOutLd[7]==1'b0)
            PCOutD[7] = Din[7];
         else
            PCOutD[7] = nOBFA;
            
     always @(reset or PCOutLd[6] or Din[6])  //PCOutD[6]
         if(PCOutLd[6]==1'b0)
            PCOutD[6] = Din[6];
         else
            PCOutD[6] = PCOut[6];
 /*           
     always @(reset or PCOutLd[7] or nOBFA or Din[7])  //PCOutD[7]
         if(PCOutLd[7]==1'b0)
            PCOutD[7] = Din[7];
         else
            PCOutD[7] = nOBFA;
            
     always @(reset or PCOutLd[7] or nOBFA or Din[7])  //PCOutD[7]
         if(PCOutLd[7]==1'b0)
            PCOutD[7] = Din[7];
         else
            PCOutD[7] = nOBFA;
            
     always @(reset or PCOutLd[7] or nOBFA or Din[7])  //PCOutD[7]
         if(PCOutLd[7]==1'b0)
            PCOutD[7] = Din[7];
         else
            PCOutD[7] = nOBFA;
            
     always @(reset or PCOutLd[7] or nOBFA or Din[7])  //PCOutD[7]
         if(PCOutLd[7]==1'b0)
            PCOutD[7] = Din[7];
         else
            PCOutD[7] = nOBFA;
            
     always @(reset or PCOutLd[7] or nOBFA or Din[7])  //PCOutD[7]
         if(PCOutLd[7]==1'b0)
            PCOutD[7] = Din[7];
         else
            PCOutD[7] = nOBFA;
            
     always @(reset or PCOutLd[7] or nOBFA or Din[7])  //PCOutD[7]
         if(PCOutLd[7]==1'b0)
            PCOutD[7] = Din[7];
         else
            PCOutD[7] = nOBFA;
*/

     always @(reset or PCStatusBuf)  //PCStatus
        if(reset)
            PCStatus = 8'b00000000;
        else
            PCStatus = PCStatusBuf;
     
     
     //从高位到低位依次处理口C状态字PCStatus 
     always @(PCOutLd[7] or PCIn[7] or ModeA or PAIO or PCOut[7])  //PCStatusBuf[7]
        if(PCOutLd[7]==1'b0)
            PCStatusBuf[7] = PCIn[7];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[7] = PCIn[7];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[7] = PCOut[7];
        else
            PCStatusBuf[7] = PCStatus[7];
            
      always @(PCOutLd[6] or PCIn[6] or ModeA or PAIO or PCOut[6])  //PCStatusBuf[6]
        if(PCOutLd[6]==1'b0)
            PCStatusBuf[6] = PCIn[6];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[6] = PCIn[6];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[6] = PCOut[6];
        else
            PCStatusBuf[6] = PCStatus[6];
            
      always @(PCOutLd[5] or PCIn[5] or ModeA or PAIO or PCOut[5])  //PCStatusBuf[5]
        if(PCOutLd[5]==1'b0)
            PCStatusBuf[5] = PCIn[5];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[5] = PCIn[5];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[5] = PCOut[5];
        else
            PCStatusBuf[5] = PCStatus[5];
            
      always @(PCOutLd[4] or PCIn[4] or ModeA or PAIO or PCOut[4])  //PCStatusBuf[4]
        if(PCOutLd[4]==1'b0)
            PCStatusBuf[4] = PCIn[4];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[4] = PCIn[4];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[4] = PCOut[4];
        else
            PCStatusBuf[4] = PCStatus[4];
            
      always @(PCOutLd[3] or PCIn[3] or ModeA or PAIO or PCOut[3])  //PCStatusBuf[3]
        if(PCOutLd[3]==1'b0)
            PCStatusBuf[3] = PCIn[3];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[3] = PCIn[3];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[3] = PCOut[3];
        else
            PCStatusBuf[3] = PCStatus[3];
            
      always @(PCOutLd[2] or PCIn[2] or ModeA or PAIO or PCOut[2])  //PCStatusBuf[2]
        if(PCOutLd[2]==1'b0)
            PCStatusBuf[2] = PCIn[2];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[2] = PCIn[2];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[2] = PCOut[2];
        else
            PCStatusBuf[2] = PCStatus[2];
            
      always @(PCOutLd[1] or PCIn[1] or ModeA or PAIO or PCOut[1])  //PCStatusBuf[1]
        if(PCOutLd[1]==1'b0)
            PCStatusBuf[1] = PCIn[1];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[1] = PCIn[1];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[1] = PCOut[1];
        else
            PCStatusBuf[1] = PCStatus[1];
            
      always @(PCOutLd[0] or PCIn[0] or ModeA or PAIO or PCOut[0])  //PCStatusBuf[0]
        if(PCOutLd[0]==1'b0)
            PCStatusBuf[0] = PCIn[0];
        else if(ModeA==2'b01 && PAIO==1'b0)
            PCStatusBuf[0] = PCIn[0];
        else if((ModeA==2'b01 && PAIO==1'b1) || ModeA==2'b10)
            PCStatusBuf[0] = PCOut[0];
        else
            PCStatusBuf[0] = PCStatus[0];

      always @(reset or ModeA or PAIO or nSTBA or nRD)  //IBFA:由nSTBA信号置位，由nRD上升沿复位
        if(reset)
            IBFAstate = 2'd0;
        else
            case(IBFAstate)
                2'd0: if(ModeA!=2'b00 && PAIO==1'b0 && nSTBA==1'b0)
                        IBFAstate = 2'd1;
                      else
                        IBFAstate = 2'd0;
                2'd1: if(nRD==1'b0 && A==2'b00)
                        IBFAstate = 2'd2;
                      else 
                        IBFAstate = 2'd1;
                2'd2: if(nRD==1'b1)
                        IBFAstate = 2'd0;
                      else 
                        IBFAstate = 2'd2;
                default: IBFAstate = 2'd0;
             endcase
             
             
        always @(IBFAstate)
            if(IBFAstate==2'd1 || IBFAstate==2'd2)
                IBFA = 1'b1;
            else
                IBFA = 1'b0;
endmodule