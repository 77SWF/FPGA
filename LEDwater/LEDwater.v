`timescale 1ns / 1ps
`include "clock_div.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:05 03/05/2021 
// Design Name: 
// Module Name:    LEDwater 
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
module LEDwater(
    output reg [7:0] LEDout = 8'b0,
    input clock
    ); 
	//分频后1Hz时钟信号
    wire p_clk_1HZ;
	//50MHz时钟分频
    clock_div clock_1HZ(.CLK_50MHZ(clock),.CLK_1HZ(p_clk_1HZ));
	//流水灯
    always @(posedge p_clk_1HZ) begin
        case(LEDout)
		   8'b0:LEDout=8'b1;
			8'b1:LEDout=8'b11;
			8'b11:LEDout=8'b111;
			8'b111:LEDout=8'b1111;
			8'b1111:LEDout=8'b11111;
			8'b11111:LEDout=8'b111111;
			8'b111111:LEDout=8'b1111111;
			8'b1111111:LEDout=8'b11111111;
			8'b11111111:LEDout=8'b0;
			default:LEDout=8'b0;
		  endcase
    end
endmodule
