`timescale 1ns / 1ps

module CtrlLogic(
	output PAEn,
	output PBEn,
	output[7:0] PCEn,
	output DEn,
	output[6:0] CtrlData,
	output[3:0] DoutSelect,
	output PAOutLd,
	output PBOutLd,
	output[7:0] PCOutLd,
	input reset,
	input nRD,
	input nWR,
	input[1:0] A,
	input nCS,
	input[7:0] Din,
	input[7:0] PCin
    );
	
	//控制字的判断
	always @(reset or nCS or A or nWR or Din) begin
		if(reset) begin
			//复位，寄存器全部清零
		end 
		else if(nCS==1'b0 && A==2'b11 && nWR==1'b0 && Din[7]==1'b1)
		begin
			ControlFlag = 1'b1;
			ModeA = (Din[6])?2'b10:{Din[6:5]};
			PAIO = ~Din[4];
			PCUpIO = ~Din[3];
			ModeB = Din[2];
			PBIO = ~Din[1];
			PCLowIO = ~Din[0];
		end
		else if(nCS==1'b0 && A==2'b11 && nWR==1'b0 && Din[7]==1'b0)
		begin
			ControlFlag = 1'b0;
			BitSelect = Din[3:1];
			PCRS = Din[0];
		end
	end
	
	
	//C口控制信号CtrlData的产生
	always @(reset or ControlFlag or ModeA or ModeB or PAIO OR PBIO)//CtrlData输出给C口模块
	begin
		if(reset)
			CtrlData = 7'b0000000
		else
			CtrlData = {PCRS,ControlFlag,ModeA,ModeB,PAIO,PBIO};
	end
	
	
	//输入/输出选择信号的产生
	always @(reset or nRD or nWR)   //DEn
		if(reset)
			DEn = 1'b0;
		else if(!nWR)
			DEn = 1'b0;
		else if(!nRD)
			DEn = 1'b1;
		else
			DEn = 1'b0;
			
	always @(reset or ModeA or PAIO or nSTBA or nACKA)  //PAEn
		if(reset)
			PAEn = 1'b0;   //复位清零
		else if(ModeA != 2'b10)
			PAEn = PAIO;
		else begin
			if(nSTBA==1'b0)
				PAEn = 1'b0;
			else if(nACKA==1'b0)
				PAEn = 1'b1;
			else
				PAEn = PAIO;
		end
		
		
	always @(reset or ModeB or PBIO)   //PBEn
		if(reset)
			PBEn = 1'b0;   //复位清零
		else
			PBEn = PBIO;   //由输入输出方向决定
			
	
	always @(reset or ModeB or PCLowIO)  //PCEn[2-0],低三位由B口决定
		if(reset)
			PCEn[2:0] = 3'b000;
		else if(ModeB==1'b1)
			PCEn[2:0] = {1'b0,1'b1,1'b1};  //B口方式1，固定
		else
			PCEn[2:0] = {3{PCLowIO}};  //B口方式0,由输入输出方向决定
			
	
	always @(reset or ModeA or PCUpIO or PCLowIO or PAIO)  //PCEn[7-3],高5位，由A口决定
		if(reset)
			PCEn[7:3] = 5'b00000;
		else if(ModeA==2'b10)
			PCEn[7:3] = 5'b10101;   //A口方式2，固定
		else if(ModeA==2'b01)  //A口方式1，与方向有关
		begin
			if(PAIO==1'b0)
				PCEn[7:3] = {{2{PCUpIO}},1'b1,1'b0,1'b1};  //A口方式1输入
			else
				PCEn[7:3] = {1'b1,1'b0,{2{PCLowIO}},1'b1};  //A口方式1输出
		end
		else
			PCEn[7:3] = {{4{PCUpIO}},PCLowIO};  //A口方式0
				
 	always @(reset or A or nRD)  //PAInLd
	 	if (reset)
	   		PAInLd = 1'b0;  //复位清零
	 	else if (nCS==1'b0 && A==2'b00 && nRD==1'b0)
	  		PAInLd = 1'b0;  //A口选中，读
	 	else
	   		PAInLd = 1'b1;  //其它情况
	   
	 always @(reset or A or nRD)   //PBInLd
	 	if(reset)
		 	PBInLd = 1'b0;  //复位清零
		else if(nCS==1'b0 && A==2'b01 && nRD==1'b0)
			PBInLd = 1'b0;  //B口选中，读
		else
			PBInLd = 1'b1;  //其它情况
			