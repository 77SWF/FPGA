`timescale 1ns / 1ps

module clock_div7(
    output reg clk_div7 = 1'b1,
    input clock,
    input rst_n);
    
	 
    reg [3:1] cnt=3'b0;//��Ƶ��ʱ��

    always @(posedge clock, negedge rst_n) //rst_n�첽��λ
    begin
        if(!rst_n)
        begin
            cnt <= 1'b0;
            clk_div7 <= 1'b0;
        end
        else
        begin //clk_div7����Ϊ7��clockʱ������
            //4��clockʱ�����������1
            if(cnt < 3)
                cnt <= cnt + 1;
            else if(cnt == 3)
            begin
                clk_div7 <= ~clk_div7;
                cnt <= cnt + 1;
            end
            //3��clockʱ�����������0
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
