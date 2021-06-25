///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2021 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : CNT_ILA.veo
// /___/   /\     Timestamp  : Mon Mar 22 18:43:54 中国标准时间 2021
// \   \  /  \
//  \___\/\___\
//
// Design Name: ISE Instantiation template
///////////////////////////////////////////////////////////////////////////////

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
CNT_ILA YourInstanceName (
    .CONTROL(CONTROL), // INOUT BUS [35:0]
    .CLK(CLK), // IN
    .DATA(DATA), // IN BUS [3:0]
    .TRIG0(TRIG0) // IN BUS [3:0]
);

// INST_TAG_END ------ End INSTANTIATION Template ---------

