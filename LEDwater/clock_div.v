`timescale 1ns / 1ps

module clock_div(
    input CLK_50MHZ,
    output reg CLK_1HZ=1'b1);
    
    parameter PULSECOUNT = 25'b1011111010111100001000000,//分频计时器上限值
              RESETZERO = 25'b0;//计时器复位
    
    reg [25:1] counter=1'b0;//分频计时器

    always @(posedge CLK_50MHZ ) begin
        if(counter < PULSECOUNT)
            counter <= counter + 1'b1;
        else begin
            CLK_1HZ <= ~CLK_1HZ;
            counter <= RESETZERO;
        end
    end
endmodule
