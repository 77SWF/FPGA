`timescale 1ns / 1ps

module clock_div7(
    output reg clk_div7 = 1'b1,
    input clock,
    input rst_n);
    
	 
    reg [3:1] cnt=3'b0;//分频计时器

    always @(posedge clock, negedge rst_n) //rst_n异步复位
    begin
        if(!rst_n)
        begin
            cnt <= 1'b0;
            clk_div7 <= 1'b0;
        end
        else
        begin //clk_div7周期为7个clock时钟周期
            //4个clock时钟周期跳变成1
            if(cnt < 3)
                cnt <= cnt + 1;
            else if(cnt == 3)
            begin
                clk_div7 <= ~clk_div7;
                cnt <= cnt + 1;
            end
            //3个clock时钟周期跳变成0
            else if(cnt < 6)
                cnt <= cnt + 1;
            else
            begin
                clk_div7 <= ~clk_div7;
                cnt <= 1'b0;
            end
        end
    end 
endmodule
