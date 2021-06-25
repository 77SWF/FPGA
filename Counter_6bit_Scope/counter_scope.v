`timescale 1ns / 1ps
`include "clock_div7.v"
`include "counter.v"

module counter_scope(
    output [5:0] LEDOut, //6λ������������LED7~2
    input clock, //50MHzʱ�Ӿ���
    input rst_n, //SW0 ��������λ��ť
    input dir); //SW1 �����������
    
    
    // �����������⸴λ���ƺͷ���������� din
	wire [1:0] vrst;
	wire [1:0] vdir;
	wire rst_L;
	wire dir_H;
	assign rst_L = rst_n | ( vrst[1] & vrst[0] );
	assign dir_H = dir | ( vdir[1] & vdir[0] );
    

    //ʵ������
    wire clk_div7;
    clock_div7 m_clk_div(.clk_div7(clk_div7), .clock(clock), .rst_n(rst_n));
    
    wire [5:0] cnt;
    counter m_cnt(.count(cnt), .clock(clk_div7),.rst_n(rst_n), .dir(dir));

    //6λ����������LED7~2
    assign LEDOut = cnt;

    
    wire [1:0] cnt2b;
    assign cnt2b = cnt[5:4];

    wire [5:0] VLED;
    assign VLED = cnt;//6λ��6��LED��
    

    
    /* ���.VEO�ļ����� */
    //////////////////////////////////////////////////////////////////////////
    
    // �����������ӿ��ƶ˿ڵ� 36 λ wire ����
	wire [35:0] CONTROL0; // ���ڿ����߼������� CNT_ILA
	wire [35:0] CONTROL1; // ���ڿ�����������/����˿� CNT_VIO
    
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    CNT_ICON m_icon (
        .CONTROL0(CONTROL0), // INOUT BUS [35:0]
        .CONTROL1(CONTROL1) // INOUT BUS [35:0]
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------



    // �������Ӵ��������˿ڵ� 2 λ wire ����, ʹ�ü����������� 2 λ����
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

    // �������⸴λ���ƺͷ������ { vrst, vdir }
	assign vrst = din[3:2];
	assign vdir = din[1:0];
    
endmodule
