`timescale 1ns / 1ps
`include "clock_div7.v"
`include "counter.v"

module counter_scope(
    output [5:0] LEDOut, //6位计数器，连接LED7~2
    input clock, //50MHz时钟晶振
    input rst_n, //SW0 计数器复位按钮
    input dir); //SW1 计数方向控制
    
    
    // 用于连接虚拟复位控制和方向控制输入 din
	wire [1:0] vrst;
	wire [1:0] vdir;
	wire rst_L;
	wire dir_H;
	assign rst_L = rst_n | ( vrst[1] & vrst[0] );
	assign dir_H = dir | ( vdir[1] & vdir[0] );
    

    //实例引用
    wire clk_div7;
    clock_div7 m_clk_div(.clk_div7(clk_div7), .clock(clock), .rst_n(rst_n));
    
    wire [5:0] cnt;
    counter m_cnt(.count(cnt), .clock(clk_div7),.rst_n(rst_n), .dir(dir));

    //6位计数器连接LED7~2
    assign LEDOut = cnt;

    
    wire [1:0] cnt2b;
    assign cnt2b = cnt[5:4];

    wire [5:0] VLED;
    assign VLED = cnt;//6位，6个LED灯
    

    
    /* 添加.VEO文件内容 */
    //////////////////////////////////////////////////////////////////////////
    
    // 定义两个连接控制端口的 36 位 wire 变量
	wire [35:0] CONTROL0; // 用于控制逻辑分析仪 CNT_ILA
	wire [35:0] CONTROL1; // 用于控制虚拟输入/输出端口 CNT_VIO
    
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    CNT_ICON m_icon (
        .CONTROL0(CONTROL0), // INOUT BUS [35:0]
        .CONTROL1(CONTROL1) // INOUT BUS [35:0]
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------



    // 定义连接触发采样端口的 2 位 wire 变量, 使用计数器输出最高 2 位触发
	wire [1:0] trig = cnt2b; 
    
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    CNT_ILA m_ila (
        .CONTROL(CONTROL0), // INOUT BUS [35:0]
        .CLK(clock), // IN
        .DATA(VLED), // IN BUS [3:0]
        .TRIG0(trig) // IN BUS [3:0]
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------



    wire [3:0] din;
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    CNT_VIO YourInstanceName (
        .CONTROL(CONTROL1), // INOUT BUS [35:0]
        .ASYNC_IN(VLED), // IN BUS [5:0]
        .ASYNC_OUT(din) // OUT BUS [4:0]
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------

    // 连接虚拟复位控制和方向控制 { vrst, vdir }
	assign vrst = din[3:2];
	assign vdir = din[1:0];
    
endmodule
