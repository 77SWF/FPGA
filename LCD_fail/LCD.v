`timescale 1ns / 1ps

module LCD(
    input clock,//system clock 50MHZ
    input reset,//BTN_WEST pin=D18
    output LCD_E,//1:enable LCD
    output LCD_RS,//data=1 or instruction=0
    output LCD_RW,//read/write SF_D
    output [3:0] SF_D,//display character or instruction
    output SF_CE0 //=1 disable StrataFlash to SF_D
    );
    //disable StrataFlash to SF_D
    assign SF_CE0 = 1'b1;

    //LCD write only
    assign LCD_RW = 1'b0;

    //��ʾ�����õ�״̬
    parameter DISPLAY_IDLE = 11'b0_0000_0000_01,
              FUNCTION_SET = 11'b0_0000_0000_10,
              ENTRY_MODE_SET = 11'b0_0000_0001_00,
              DISPLAY_ON_OFF = 11'b0_0000_0010_00,
              CLEAR_DISPLAY = 11'b0_0000_0100_00,
              CLEAR_WAIT_1_64MS = 10'b0_0000_1000_00,
              SET_DD_RAM_ADDRESS = 11'b0_0001_0000_00,
              WRITE_LINE_1 = 11'b0_0010_0000_00,
              WAIT_40US_TO_LINE_2 = 11'b0_0100_0000_00,
              WRITE_LINE_2 = 11'b0_1000_0000_00,
              DISPLAY_DONE = 11'b1_0000_0000_00
              ;
    // ������ʾ��״̬����״̬�Ĵ���
    reg [10:0] display_state;

    //1:�ϵ��ʼ���׶� 0:�����׶�
    reg is_init;

    always @(*) 
    begin
        case(display_state)
            DISPLAY_IDLE: is_init = 1'b0;
            FUNCTION_SET,
            ENTRY_MODE_SET,
            DISPLAY_ON_OFF,
            CLEAR_DISPLAY,
            CLEAR_WAIT_1_64MS,
            SET_DD_RAM_ADDRESS,
            WRITE_LINE_1,
            WAIT_40US_TO_LINE_2,
            WRITE_LINE_2,
            DISPLAY_DONE: is_init = 1'b1;
            default: is_init = 1'b0;
        endcase    
    end

    //reg�����ڶ��always�ڸ�ֵ����������reg����
    reg LCD_E_,
        LCD_E_init,
        LCD_RS_;
    reg [3:0] SF_D_,
              SF_D_init;

    assign LCD_E = (is_init) ? LCD_E_init : LCD_E_,
           LCD_RS = LCD_RS_;
    assign SF_D = (is_init) ? SF_D_init : SF_D_;

    /* �ϵ���ʼ�� Mealy״̬��

    A���ȴ� 15ms ��������� 50MHzʱ��15ms ʱ����� 750000 ʱ�����ڡ�
    B��д SF_D<11:8>=0x3��LCD_E ���ָߵ�ƽ 12 ʱ�����ڡ�
    C���ȴ� 4.1ms ����������� 50MHz ʱ��205000 ʱ�����ڡ�
    D��д SF_D<11:8>=0x3��LCD_E ���ָߵ�ƽ 12 ʱ�����ڡ�
    E���ȴ� 100us ����������� 50MHz ʱ��5000 ʱ�����ڡ�
    F��д SF_D<11:8>=0x3��LCD_E ���ָߵ�ƽ 12 ʱ�����ڡ�
    G���ȴ� 40us ����������� 50MHz ʱ��2000 ʱ�����ڡ�
    H��д SF_D<11:8>=0x2��LCD_E ���ָߵ�ƽ 12 ʱ�����ڡ�
    I���ȴ� 40us ����������� 50MHz ʱ��2000 ʱ�����ڡ�
    */

    //��ʼ����11��״̬
    parameter INIT_IDLE = 11'b0_0000_0000_01,
              WAIT_15MS = 11'b0_0000_0000_10,
              WRITE_1 = 11'b0_0000_0001_00,
              WAIT_4_1MS = 11'b0_0000_0010_00,
              WRITE_2 = 11'b0_0000_0100_00,
              WAIT_100UM = 10'b0_0000_1000_00,
              WRITE_3 = 11'b0_0001_0000_00,
              WAIT_40UM_1 = 11'b0_0010_0000_00,
              WRITE_4 = 11'b0_0100_0000_00,
              WAIT_40UM_2 = 11'b0_1000_0000_00,
              INIT_DONE = 11'b1_0000_0000_00
              ;

    reg [10:0] init_state;
    reg [19:0] init_cnt;//��ʼ�����̼�ʱ��
    reg init_done;//��ʼ��״̬���� 1:��ʼ����� 0:��ʼ��δ���

    reg init_begin;

    //��ʼ��״̬��
    always @(posedge clock) 
    begin
        if(reset)
        begin
            init_state <= INIT_IDLE;

            SF_D_init <= 4'b0;
            LCD_E_init <= 0;

            init_cnt <= 1'b0;
            init_done <= 1'b0;
        end
        else
        begin
            case (init_state)
                INIT_IDLE:
                    begin
                        LCD_E_init <= 0;
                        init_done <= 1'b0;
                        
                        //����������״̬�������ϵ��ʼ��
                        if(init_begin)
                            init_state <= WAIT_15MS;
                        else
                            init_state <= INIT_IDLE;
                    end
                //�ȴ� 15ms ��������� 50MHzʱ��15ms ʱ����� 750000 ʱ������
                WAIT_15MS:
                    begin
                        LCD_E_init <= 0;
                        if(init_cnt < 750000)
                        begin
                            SF_D_init <= 4'h0;
                            init_cnt <= init_cnt + 1;
                            init_state <= WAIT_15MS;
                        end
                        else
                        begin
                            init_cnt <= 0;
                            init_state <= WRITE_1;
                        end
                    end
                // д SF_D<11:8>=0x3��LCD_E ���ָߵ�ƽ 12 ʱ������
                WRITE_1:
                    begin
                        SF_D_init <= 4'h3;
                        LCD_E_init <= 1'b1; //LCD_E ���ָߵ�ƽ
                        if(init_cnt < 12)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WRITE_1;
                        end
                        else 
                        begin
                            init_cnt <= 0;
                            init_state <= WAIT_4_1MS;
                        end
                    end
                //�ȴ� 4.1ms ����������� 50MHz ʱ��205000 ʱ������
                WAIT_4_1MS:
                    begin
                        LCD_E_init <= 1'b0;
                        if(init_cnt < 205000)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WAIT_4_1MS;
                        end
                        else
                        begin
                            init_cnt <= 0;
                            init_state <= WRITE_2;
                        end
                    end
                //д SF_D<11:8>=0x3��LCD_E ���ָߵ�ƽ 12 ʱ������
                WRITE_2:
                    begin
                        SF_D_init <= 4'h3;
                        LCD_E_init <= 1'b1; //LCD_E ���ָߵ�ƽ
                        if(init_cnt < 12)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WRITE_2;
                        end
                        else 
                        begin
                            init_cnt <= 0;
                            init_state <= WAIT_100UM;
                        end
                    end
                //�ȴ� 100us ����������� 50MHz ʱ��5000 ʱ������
                WAIT_100UM:
                    begin
                        LCD_E_init <= 1'b0;
                        if(init_cnt < 5000)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WAIT_100UM;
                        end
                        else
                        begin
                            init_cnt <= 0;
                            init_state <= WRITE_3;
								end
                    end
                //д SF_D<11:8>=0x3��LCD_E ���ָߵ�ƽ 12 ʱ������
                WRITE_3:
                    begin
                        SF_D_init <= 4'h3;
                        LCD_E_init <= 1'b1; //LCD_E ���ָߵ�ƽ
                        if(init_cnt < 12)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WRITE_3;
                        end
                        else 
                        begin
                            init_cnt <= 0;
                            init_state <= WAIT_40UM_1;
                        end
                    end
                //�ȴ� 40us ����������� 50MHz ʱ��2000 ʱ������
                WAIT_40UM_1:
                    begin
                        LCD_E_init <= 1'b0;
                        if(init_cnt < 2000)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WAIT_40UM_1;
                        end
                        else
                        begin
                            init_cnt <= 0;
                            init_state <= WRITE_4;
								end
                    end
                //д SF_D<11:8>=0x2��LCD_E ���ָߵ�ƽ 12 ʱ������
                WRITE_4:
                    begin
                        SF_D_init <= 4'h2;
                        LCD_E_init <= 1'b1; //LCD_E ���ָߵ�ƽ
                        if(init_cnt < 12)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WRITE_4;
                        end
                        else 
                        begin
                            init_cnt <= 0;
                            init_state <= WAIT_40UM_2;
                        end
                    end
                //�ȴ� 40us ����������� 50MHz ʱ��2000 ʱ������
                WAIT_40UM_2:
                    begin
                        LCD_E_init <= 1'b0;
                        if(init_cnt < 2000)
                        begin
                            init_cnt <= init_cnt + 1;
                            init_state <= WAIT_40UM_2;
                        end
                        else
                        begin
                            init_cnt <= 0;
                            init_state <= INIT_DONE;
								end
                    end
                INIT_DONE:
                    begin
                        init_done <= 1'b1;
                        init_state <= INIT_DONE;

                        SF_D_init <= 4'b0;
                        LCD_E_init <= 1'B0;
                    end
                default:
                    begin
                        init_state <= INIT_IDLE;

                        SF_D_init <= 4'b0;
                        LCD_E_init <= 1'B0;
                        
                        init_done <= 1'b0;
                        init_cnt <= 1'b0;
                    end
            endcase
        end
        
        
    end
    
    /* ��ʾ������ Mealy״̬��

    �ϵ��ʼ����ɺ�4 λ�����ݽӿھͽ����ˡ���һ������������ʾ���ˣ�
    A����һ�������������0x28��������ʾ����
    B����һ������ģʽ���0X06��������ʾ���Զ�����ַָ�롣
    C����һ����ʾ��/�����0x0c������ʾ����ʧ��ָ��͹�ꡣ
    D����󣬷���������˺�ȴ����� 1.64ms��82000 ʱ�����ڣ���
    */

    /*д��ǰ��

    //��ʾ�����õ�״̬
    parameter DISPLAY_IDLE = 11'b0_0000_0000_01,
              FUNCTION_SET = 11'b0_0000_0000_10,
              ENTRY_MODE_SET = 11'b0_0000_0001_00,
              DISPLAY_ON_OFF = 11'b0_0000_0010_00,
              CLEAR_DISPLAY = 11'b0_0000_0100_00,
              CLEAR_WAIT_1_64MS = 10'b0_0000_1000_00,
              SET_DD_RAM_ADDRESS = 11'b0_0001_0000_00,
              WRITE_LINE_1 = 11'b0_0010_0000_00,
              WAIT_40US_TO_LINE_2 = 11'b0_0100_0000_00,
              WRITE_LINE_2 = 11'b0_1000_0000_00,
              DISPLAY_DONE = 11'b1_0000_0000_00
              ;
    
    reg [10:0] display_state; 
    */
    reg [10:0] display_cnt;//��ʾ�����ù��̼�ʱ��
    reg display_done;

    //һ�����ַ���������0~15
    reg [3:0] cnt_line_1 = 4'b0,
              cnt_line_2 = 4'b0;

    //��LCD�����һ���ַ���8bit��
    reg [7:0] character_8bit;
	 
	//���ݴ���������ʶ
	reg text_ctrl;

    // �ݴ洫���һ/���е�8bit�ַ�
    reg [7:0] text_line_1;
    reg [7:0] text_line_2;

    always @(posedge clock) 
    begin
        if(reset)
        begin
            display_state <= DISPLAY_IDLE;

            cnt_line_1 <= 1'b0;
            cnt_line_2 <= 1'b0;

            display_cnt <= 1'b0;

            text_ctrl <= 1'b0;
        end    
        else
        begin
            case(display_state)
                //�����ϵ��ʼ��
                DISPLAY_IDLE:
                    begin
                        init_begin <= 1'b1;
                        text_ctrl <= 1'b0;

                        if(init_done)
                        begin
                            display_state <= FUNCTION_SET;

                            cnt_line_1 <= 1'b0;
                            cnt_line_2 <= 1'b0;

                        end
                        else
                        begin
                            display_state <= DISPLAY_IDLE;
                        end

                    end
                //�ϵ��ʼ����Ϻ�
                //A����һ�������������0x28��������ʾ����
                FUNCTION_SET:
                    begin
                        character_8bit <= 8'h28;
                        LCD_RS_ <= 1'b0; //����LCD����ָ��
                        text_ctrl <= 1'b1;

                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_cnt <= display_cnt + 1;
                            display_state <= FUNCTION_SET;
                        end
                        else
                        begin
                            display_state <= ENTRY_MODE_SET;
                            display_cnt <= 1'b0;
                        end
                    end
                //B����һ������ģʽ���0X06��������ʾ���Զ�����ַָ�롣
                ENTRY_MODE_SET:
                    begin
                        character_8bit <= 8'h06;
                        LCD_RS_ <= 1'b0; //����LCD����ָ��
                        text_ctrl <= 1'b1;

                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_cnt <= display_cnt + 1;
                            display_state <= ENTRY_MODE_SET;
                        end
                        else
                        begin
                            display_state <= DISPLAY_ON_OFF;
                            display_cnt <= 1'b0;
                        end
                    end
                //C����һ����ʾ��/�����0x0c������ʾ����ʧ��ָ��͹�ꡣ
                DISPLAY_ON_OFF:
                    begin
                        character_8bit <= 8'h0c;
                        LCD_RS_ <= 1'b0; //����LCD����ָ��
                        text_ctrl <= 1'b1;

                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_cnt <= display_cnt + 1;
                            display_state <= DISPLAY_ON_OFF;
                        end
                        else
                        begin
                            display_state <= CLEAR_DISPLAY;
                            display_cnt <= 1'b0;
                        end
                    end
                //D����󣬷���������
                CLEAR_DISPLAY:
                    begin
                        character_8bit <= 8'b1;
                        LCD_RS_ <= 1'b0; //����LCD����ָ��
                        text_ctrl <= 1'b1;

                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_cnt <= display_cnt + 1;
                            display_state <= CLEAR_DISPLAY;
                        end
                        else
                        begin
                            display_state <= CLEAR_WAIT_1_64MS;
                            display_cnt <= 1'b0;
                        end
                    end
                //�˺�ȴ����� 1.64ms��82000 ʱ�����ڣ�
                CLEAR_WAIT_1_64MS:
                    begin
                        text_ctrl <= 1'b0;
                        if(display_cnt <= 82000)
                        begin
                            display_state <= CLEAR_WAIT_1_64MS;
                            display_cnt <= display_cnt + 1;
                        end
                        else
                        begin
                            display_state <= SET_DD_RAM_ADDRESS;
                            display_cnt <= 1'b0;
                        end
                    end
                //
                SET_DD_RAM_ADDRESS:
                    begin
                        character_8bit <= 8'b1000_0000;
                        LCD_RS_ <= 1'b0; //����LCD����ָ��
                        text_ctrl <= 1'b1;
                        
                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_cnt <= display_cnt + 1;
                            display_state <= SET_DD_RAM_ADDRESS;
                        end
                        else
                        begin
                            display_state <= WRITE_LINE_1;
                            display_cnt <= 1'b0;
                            cnt_line_1 <= 0;
                        end
                    end
                //
                WRITE_LINE_1:
                    begin
                        character_8bit <= text_line_1;
                        LCD_RS_ <= 1'b1; //����LCD��������
                        text_ctrl <= 1'b1;

                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_state <= WRITE_LINE_1;
                            display_cnt <= display_cnt + 1;
                        end
                        else if(cnt_line_1 < 14)
                        begin
                            display_state <= WRITE_LINE_1;
                            cnt_line_1 <= cnt_line_1 + 1;
                        end
                        else
                        begin
                            display_state <= WAIT_40US_TO_LINE_2;
                            cnt_line_1 <= 0;
                        end
                    end
                //
                WAIT_40US_TO_LINE_2:
                    begin
                        character_8bit <= 8'b1100_0000;
                        LCD_RS_ <= 1'b0; //����LCD��������
                        text_ctrl <= 1'b1;

                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_cnt <= display_cnt + 1;
                            display_state <= WAIT_40US_TO_LINE_2;
                        end
                        else
                        begin
                            display_state <= WRITE_LINE_2;
                            cnt_line_2 <= 0;
                        end
                    end
                //
                WRITE_LINE_2:
                    begin
                        character_8bit <= text_line_2;
                        LCD_RS_ <= 1'b1; //����LCD��������
                        text_ctrl <= 1'b1;
                        
                        //һ��8λ��д�������¸�ͨ��֮ǰ����������40us(50MHz��2000����)
                        if(display_cnt <= 2000)
                        begin
                            display_state <= WRITE_LINE_2;
                            display_cnt <= display_cnt + 1;
                        end
                        else if(cnt_line_2 < 11)
                        begin
                            display_state <= WRITE_LINE_2;
                            cnt_line_2 <= cnt_line_2 + 1;
                        end
                        else
                        begin
                            display_state <= DISPLAY_DONE;
                            cnt_line_2 <= 0;
                        end
                    end
                //
                DISPLAY_DONE:
                    begin
                        text_ctrl <= 1'b0;
                        display_state <= DISPLAY_DONE;
                    end
                default:
                    begin
                        display_state <= DISPLAY_IDLE;

                        cnt_line_1 <= 1'b0;
                        cnt_line_2 <= 1'b0;

                        display_cnt <= 1'b0;

                        text_ctrl <= 1'b0;
                    end
            endcase
        end
    end

    /* �����ַ����ݸ�LCD Mealy״̬�� */

    //�����ַ���״̬
    parameter TEXT_IDLE = 7'b0000_001,
              UPPER_4BIT = 7'b0000_010,
              UPPER_ENABLE_230NS = 7'b0000_100,
              UP_TO_LOW_1US = 7'b0001_000,
              LOWER_4BIT = 7'b0010_000,
              LOWER_ENABLE_230NS = 7'b0100_000,
              BETWEEN_40US = 7'b1000_000
              ;


    //����״̬�Ĵ���
    reg [6:0] text_state;

    //�ַ����ݴ����ʱ��
    reg [10:0] text_cnt;

    always @(posedge clock) 
    begin
        if(reset)
        begin
            LCD_E_ <= 1'b0;
            SF_D_ <= 4'b0;

            text_state <= TEXT_IDLE;
            text_cnt <= 1'b0;
        end    
        else
        begin
            case(text_state)
                TEXT_IDLE:
                    begin
                        LCD_E_ <= 1'b0;
                        SF_D_ <= 4'b0;

                        text_cnt <= 1'b0;

                        if(text_ctrl)
                        begin
                            text_state <= UPPER_4BIT;
                        end
                        else
                        begin
                            text_state <= TEXT_IDLE;
                        end
                    end
                UPPER_4BIT:
                    begin
                        SF_D_ <= character_8bit[7:4];

                        //�Ĵ���ѡ���źţ�LCD_RS���Լ���/д��LCD_RW�������źű��뽨��
                        //����ʹ���ź� LCD_E ת��ߵ�ƽ֮ǰ�����ȶ� 40ns(2ʱ������)
                        if(text_cnt < 2)
                        begin
                            LCD_E_ <= 1'b0;
                            text_state <= UPPER_4BIT;
                            text_cnt <= text_cnt + 1;
                        end
                        else
                        begin
                            LCD_E_ <= 1'b1;
                            text_state <= UPPER_ENABLE_230NS;
                            text_cnt <= 1'b0;
                        end

                    end
                UPPER_ENABLE_230NS:
                    begin
                        SF_D_ <= character_8bit[7:4];

                        //ʹ���źű��뱣���ߵ�ƽ 230ns �����ʱ��(12 ʱ�����ڣ�50MHz��)
                        if(text_cnt < 12)
                        begin
                            LCD_E_ <= 1'b1;
                            text_state <= UPPER_ENABLE_230NS;
                            text_cnt <= text_cnt + 1;
                        end
                        else
                        begin
                            LCD_E_ <= 1'b0;
                            text_state <= UP_TO_LOW_1US;
                            text_cnt <= 1'b0;
                        end
                    end
                //ÿ�� 8 λ���ͱ����Ϊ 2 �� 4 λ������ʱ������ 1us(50��ʱ������)
                UP_TO_LOW_1US:
                    begin
                        LCD_E_ <= 1'b0;

                        if(text_cnt < 50)
                        begin
                            text_state <= UP_TO_LOW_1US;
                            text_cnt <= text_cnt + 1;
                        end
                        else
                        begin
                            text_state <= LOWER_4BIT;
                            text_cnt <= 1'b0;
                        end
                    end
                LOWER_4BIT:
                    begin
                        SF_D_ <= character_8bit[3:0];

                        //�Ĵ���ѡ���źţ�LCD_RS���Լ���/д��LCD_RW�������źű��뽨��
                        //����ʹ���ź� LCD_E ת��ߵ�ƽ֮ǰ�����ȶ� 40ns(2ʱ������)
                        if(text_cnt < 2)
                        begin
                            LCD_E_ <= 1'b0;
                            text_state <= LOWER_4BIT;
                            text_cnt <= text_cnt + 1;
                        end
                        else
                        begin
                            LCD_E_ <= 1'b1;
                            text_state <= LOWER_ENABLE_230NS;
                            text_cnt <= 1'b0;
                        end
                    end
                LOWER_ENABLE_230NS:
                    begin
                        SF_D_ <= character_8bit[3:0];

                        //ʹ���źű��뱣���ߵ�ƽ 230ns �����ʱ��(12 ʱ�����ڣ�50MHz��)
                        if(text_cnt < 12)
                        begin
                            LCD_E_ <= 1'b1;
                            text_state <= LOWER_ENABLE_230NS;
                            text_cnt <= text_cnt + 1;
                        end
                        else
                        begin
                            LCD_E_ <= 1'b0;
                            text_state <= BETWEEN_40US;
                            text_cnt <= 1'b0;
                        end
                    end
                BETWEEN_40US:
                    begin
                        LCD_E_ <= 1'b0;

                        //һ�� 8 λ��д�������¸�ͨ��֮ǰ���������� 40us(20ʱ������)
                        if(text_cnt <= 2000)
                        begin
                            text_state <= BETWEEN_40US;
                            text_cnt <= text_cnt + 1;
                        end
                        else
                        begin
                            text_state <= TEXT_IDLE; //����д��һ��8bit�ַ�
                            text_cnt <= 1'b0;
                        end
                    end
                default:
                    begin
                        LCD_E_ <= 1'b0;
                        SF_D_ <= 4'b0;

                        text_state <= TEXT_IDLE;
                        text_cnt <= 1'b0;
                    end
            endcase
        end
    end
    
    /* ��ʾ�ַ������� 
    �� 1 ����ʾ��Spartan-3E��FPGA
    �� 2 ����ʾ��FPAG��Starter
    */

    always @(*) 
    begin
        case (cnt_line_1)
            0:	text_line_1 = 8'b0101_0011;		// �ַ�S
			1:	text_line_1	= 8'b0111_0000;		// �ַ�p
			2:	text_line_1 = 8'b0110_0001;		// �ַ�a
			3:	text_line_1	= 8'b0111_0010;		// �ַ�r
			4:	text_line_1	= 8'b0111_0100;		// �ַ�t
			5:	text_line_1	= 8'b0110_0001;		// �ַ�a
			6:	text_line_1	= 8'b0110_1110;		// �ַ�n
			7:	text_line_1	= 8'b0010_1101;		// �ַ�-
			8:	text_line_1	= 8'b0011_0011;		// �ַ�3
			9:	text_line_1	= 8'b0100_0101;		// �ַ�E
			10: text_line_1	= 8'b0010_0000;		// �ַ���
			11:	text_line_1	= 8'b0100_0110;		// �ַ�F
			12: text_line_1 = 8'b0101_0000;		// �ַ�P
			13: text_line_1 = 8'b0100_0111;		// �ַ�G
			14: text_line_1 = 8'b0100_0001;		// �ַ�A
			default: text_line_1 = 8'b0;		
        endcase    
    end

    always @(*)
	begin
		case ( cnt_line_2 ) //FPGA Starter
			0:	text_line_2 = 8'b0100_0110;		// �ַ�F
			1:	text_line_2 = 8'b0101_0000;		// �ַ�P
			2:	text_line_2 = 8'b0100_0111;		// �ַ�G
			3:	text_line_2 = 8'b0100_0001;		// �ַ�A
			4:	text_line_2 = 8'b0010_0000;		// �ַ���
			5:	text_line_2 = 8'b0101_0011;		// �ַ�S
			6:	text_line_2 = 8'b0111_0100;		// �ַ�t
			7:	text_line_2 = 8'b0110_0001;		// �ַ�a
			8:	text_line_2 = 8'b0111_0010;		// �ַ�r
			9:	text_line_2 = 8'b0111_0100;		// �ַ�t
			10:	text_line_2 = 8'b0110_0101;		// �ַ�e
			11:	text_line_2 = 8'b0111_0010;		// �ַ�r
			default:text_line_2 = 8'b0;			
		endcase
	end
endmodule
