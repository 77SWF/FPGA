`timescale 1ns / 1ps

module counter(
    output [5:0] count, //6位计数器
    input clock, //50MHz时钟晶振
    input rst_n, //SW0 计数器复位按钮
    input dir); //SW1 计数方向控制

    reg [5:0] temp;

    always @(posedge clock, negedge rst_n)
    begin
        if (!rst_n) //SW0=0
        begin
            temp <= (dir) ? 6'h3f : 6'b0; //如果 SW1 =0（off）时，计数器初始值：count = 6’b0；
                                          //如果 SW1 =1（on）时，计数器初始值：count = 6’h3f；
        end
        else //SW0=1
        begin
            if (!dir) 
                temp <= temp + 1'b1; //当计数器复位 SW1 = 0（off）时，计数器递增计数；
            else 
                temp <= temp - 1'b1; //当计数器复位 SW1 =10（on）时，计数器递减计数；
        end
    end

    assign count = temp;

endmodule
