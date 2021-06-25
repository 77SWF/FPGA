`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:33 02/28/2021 
// Design Name: 
// Module Name:    debounce 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module debounce( output reg pb, // 消除回跳振荡信号后的按键动作信号输出
 input keydown, // 按键动作信号输入
 input clk_100Hz // 时序电路的 100Hz 时钟信号输入
 );
 reg [3:0] shift_pb;
 always @( posedge clk_100Hz )
 begin
 shift_pb[2:0] <= shift_pb[3:1];
 shift_pb[3] <= keydown;

 if ( shift_pb == 4'b0000 )
 pb <= 1'b0;
 else pb <= 1'b1;
 end
endmodule
