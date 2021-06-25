`timescale 1ns / 1ps

module PotaryButtonLED(
    input rotary_a,rotary_b,
    input SlideSwitch_3,
    input clock,
    output [7:0] LEDout
    );

    reg rotary_q1,rotary_q2;
    reg [1:0] rotary_in;

    //��ת��������������
    always @(posedge clock) 
    begin:rotary_filter
        rotary_in <= {rotary_b, rotary_a};
   
        case (rotary_in)
        2'b00:    rotary_q1 <= 1'b0;
        2'b01:    rotary_q2 <= 1'b0;
        2'b10:    rotary_q2 <= 1'b1;
        2'b11:    rotary_q1 <= 1'b1;
        default: begin
            rotary_q1 <= 1'b0;   
            rotary_q2 <= 1'b0;   
        end
        endcase
    end

    reg delay_rotary_q1,rotary_event,rotary_left;

    //��ת�¼�����ת����
    always @(posedge clock )
    begin : direction
        delay_rotary_q1 <= rotary_q1;
    
        if ( rotary_q1 && (!delay_rotary_q1) )
        begin
        rotary_event <= 1'b1;
        rotary_left <= rotary_q2;
        end
        else
        rotary_event <= 1'b0;
    end


    reg [7:0] tmp_LED=8'b1;
	
	//����LED�仯
    always @ (posedge clock) begin
    //����ȫ����tmp_LED=8��b0������ֵ
    if(|tmp_LED == 1'b0) begin
        case(rotary_left)
        2'b0:tmp_LED <= 8'b1000_0000;
        default:tmp_LED <= 8'b0000_0001;
        endcase
    end
    //��ת������������LED���ƶ�
    else begin
        if(rotary_event) begin
            if(rotary_left)tmp_LED<= {tmp_LED[6:0], tmp_LED[7]};
            else tmp_LED <= {tmp_LED[0], tmp_LED[7:1]};
        end
    end
    end

    //SW3���Ƶ�������ת 
	assign LEDout = SlideSwitch_3?~tmp_LED:tmp_LED;

endmodule
