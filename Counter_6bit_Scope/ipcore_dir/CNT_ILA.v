///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2021 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : CNT_ILA.v
// /___/   /\     Timestamp  : Mon Mar 22 18:43:54 中国标准时间 2021
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module CNT_ILA(
    CONTROL,
    CLK,
    DATA,
    TRIG0) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [3 : 0] DATA;
input [3 : 0] TRIG0;

endmodule
