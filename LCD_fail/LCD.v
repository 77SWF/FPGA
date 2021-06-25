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

    //显示屏配置的状态
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
    // 配置显示屏状态机的状态寄存器
    reg [10:0] display_state;

    //1:上电初始化阶段 0:其他阶段
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

    //reg不可在多个always内赋值，所以设中reg间量
    reg LCD_E_,
        LCD_E_init,
        LCD_RS_;
    reg [3:0] SF_D_,
              SF_D_init;

    assign LCD_E = (is_init) ? LCD_E_init : LCD_E_,
           LCD_RS = LCD_RS_;
    assign SF_D = (is_init) ? SF_D_init : SF_D_;

    /* 上电后初始化 Mealy状态机

    A：等待 15ms 或更长；在 50MHz时，15ms 时间等于 750000 时钟周期。
    B：写 SF_D<11:8>=0x3，LCD_E 保持高电平 12 时钟周期。
    C：等待 4.1ms 或更长，即在 50MHz 时，205000 时钟周期。
    D：写 SF_D<11:8>=0x3，LCD_E 保持高电平 12 时钟周期。
    E：等待 100us 或更长，即在 50MHz 时，5000 时钟周期。
    F：写 SF_D<11:8>=0x3，LCD_E 保持高电平 12 时钟周期。
    G：等待 40us 或更长，即在 50MHz 时，2000 时钟周期。
    H：写 SF_D<11:8>=0x2，LCD_E 保持高电平 12 时钟周期。
    I：等待 40us 或更长，即在 50MHz 时，2000 时钟周期。
    */

    //初始化的11个状态
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
    reg [19:0] init_cnt;//初始化过程计时器
    reg init_done;//初始化状态变量 1:初始化完成 0:初始化未完成

    reg init_begin;

    //初始化状态机
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
                        
                        //等完整流程状态机启动上电初始化
                        if(init_begin)
                            init_state <= WAIT_15MS;
                        else
                            init_state <= INIT_IDLE;
                    end
                //等待 15ms 或更长；在 50MHz时，15ms 时间等于 750000 时钟周期
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
                // 写 SF_D<11:8>=0x3，LCD_E 保持高电平 12 时钟周期
                WRITE_1:
                    begin
                        SF_D_init <= 4'h3;
                        LCD_E_init <= 1'b1; //LCD_E 保持高电平
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
                //等待 4.1ms 或更长，即在 50MHz 时，205000 时钟周期
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
                //写 SF_D<11:8>=0x3，LCD_E 保持高电平 12 时钟周期
                WRITE_2:
                    begin
                        SF_D_init <= 4'h3;
                        LCD_E_init <= 1'b1; //LCD_E 保持高电平
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
                //等待 100us 或更长，即在 50MHz 时，5000 时钟周期
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
                //写 SF_D<11:8>=0x3，LCD_E 保持高电平 12 时钟周期
                WRITE_3:
                    begin
                        SF_D_init <= 4'h3;
                        LCD_E_init <= 1'b1; //LCD_E 保持高电平
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
                //等待 40us 或更长，即在 50MHz 时，2000 时钟周期
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
                //写 SF_D<11:8>=0x2，LCD_E 保持高电平 12 时钟周期
                WRITE_4:
                    begin
                        SF_D_init <= 4'h2;
                        LCD_E_init <= 1'b1; //LCD_E 保持高电平
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
                //等待 40us 或更长，即在 50MHz 时，2000 时钟周期
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
    
    /* 显示屏配置 Mealy状态机

    上电初始化完成后，4 位的数据接口就建立了。下一步就是配置显示屏了：
    A：发一个功能设置命令，0x28，配置显示屏。
    B：发一个进入模式命令，0X06，设置显示屏自动增地址指针。
    C：发一个显示开/断命令，0x0c，开显示屏并失能指针和光标。
    D：最后，发清屏命令，此后等待至少 1.64ms（82000 时钟周期）。
    */

    /*写到前面

    //显示屏配置的状态
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
    reg [10:0] display_cnt;//显示屏配置过程计时器
    reg display_done;

    //一二行字符计数器，0~15
    reg [3:0] cnt_line_1 = 4'b0,
              cnt_line_2 = 4'b0;

    //向LCD传输的一个字符（8bit）
    reg [7:0] character_8bit;
	 
	//数据传输启动标识
	reg text_ctrl;

    // 暂存传输给一/二行的8bit字符
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
                //启动上电初始化
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
                //上电初始化完毕后
                //A：发一个功能设置命令，0x28，配置显示屏。
                FUNCTION_SET:
                    begin
                        character_8bit <= 8'h28;
                        LCD_RS_ <= 1'b0; //传给LCD的是指令
                        text_ctrl <= 1'b1;

                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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
                //B：发一个进入模式命令，0X06，设置显示屏自动增地址指针。
                ENTRY_MODE_SET:
                    begin
                        character_8bit <= 8'h06;
                        LCD_RS_ <= 1'b0; //传给LCD的是指令
                        text_ctrl <= 1'b1;

                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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
                //C：发一个显示开/断命令，0x0c，开显示屏并失能指针和光标。
                DISPLAY_ON_OFF:
                    begin
                        character_8bit <= 8'h0c;
                        LCD_RS_ <= 1'b0; //传给LCD的是指令
                        text_ctrl <= 1'b1;

                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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
                //D：最后，发清屏命令
                CLEAR_DISPLAY:
                    begin
                        character_8bit <= 8'b1;
                        LCD_RS_ <= 1'b0; //传给LCD的是指令
                        text_ctrl <= 1'b1;

                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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
                //此后等待至少 1.64ms（82000 时钟周期）
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
                        LCD_RS_ <= 1'b0; //传给LCD的是指令
                        text_ctrl <= 1'b1;
                        
                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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
                        LCD_RS_ <= 1'b1; //传给LCD的是数据
                        text_ctrl <= 1'b1;

                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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
                        LCD_RS_ <= 1'b0; //传给LCD的是命令
                        text_ctrl <= 1'b1;

                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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
                        LCD_RS_ <= 1'b1; //传给LCD的是数据
                        text_ctrl <= 1'b1;
                        
                        //一个8位的写操作在下个通信之前必须间隔至少40us(50MHz下2000周期)
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

    /* 传输字符数据给LCD Mealy状态机 */

    //传输字符的状态
    parameter TEXT_IDLE = 7'b0000_001,
              UPPER_4BIT = 7'b0000_010,
              UPPER_ENABLE_230NS = 7'b0000_100,
              UP_TO_LOW_1US = 7'b0001_000,
              LOWER_4BIT = 7'b0010_000,
              LOWER_ENABLE_230NS = 7'b0100_000,
              BETWEEN_40US = 7'b1000_000
              ;


    //传输状态寄存器
    reg [6:0] text_state;

    //字符数据传输计时器
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

                        //寄存器选择信号（LCD_RS）以及读/写（LCD_RW）控制信号必须建立
                        //并在使能信号 LCD_E 转向高电平之前至少稳定 40ns(2时钟周期)
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

                        //使能信号必须保留高电平 230ns 或更长时间(12 时钟周期（50MHz）)
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
                //每个 8 位传送必须分为 2 个 4 位，其间隔时间至少 1us(50个时钟周期)
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

                        //寄存器选择信号（LCD_RS）以及读/写（LCD_RW）控制信号必须建立
                        //并在使能信号 LCD_E 转向高电平之前至少稳定 40ns(2时钟周期)
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

                        //使能信号必须保留高电平 230ns 或更长时间(12 时钟周期（50MHz）)
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

                        //一个 8 位的写操作在下个通信之前必须间隔至少 40us(20时钟周期)
                        if(text_cnt <= 2000)
                        begin
                            text_state <= BETWEEN_40US;
                            text_cnt <= text_cnt + 1;
                        end
                        else
                        begin
                            text_state <= TEXT_IDLE; //继续写下一个8bit字符
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
    
    /* 显示字符的数据 
    第 1 行显示：Spartan-3E□FPGA
    第 2 行显示：FPAG□Starter
    */

    always @(*) 
    begin
        case (cnt_line_1)
            0:	text_line_1 = 8'b0101_0011;		// 字符S
			1:	text_line_1	= 8'b0111_0000;		// 字符p
			2:	text_line_1 = 8'b0110_0001;		// 字符a
			3:	text_line_1	= 8'b0111_0010;		// 字符r
			4:	text_line_1	= 8'b0111_0100;		// 字符t
			5:	text_line_1	= 8'b0110_0001;		// 字符a
			6:	text_line_1	= 8'b0110_1110;		// 字符n
			7:	text_line_1	= 8'b0010_1101;		// 字符-
			8:	text_line_1	= 8'b0011_0011;		// 字符3
			9:	text_line_1	= 8'b0100_0101;		// 字符E
			10: text_line_1	= 8'b0010_0000;		// 字符空
			11:	text_line_1	= 8'b0100_0110;		// 字符F
			12: text_line_1 = 8'b0101_0000;		// 字符P
			13: text_line_1 = 8'b0100_0111;		// 字符G
			14: text_line_1 = 8'b0100_0001;		// 字符A
			default: text_line_1 = 8'b0;		
        endcase    
    end

    always @(*)
	begin
		case ( cnt_line_2 ) //FPGA Starter
			0:	text_line_2 = 8'b0100_0110;		// 字符F
			1:	text_line_2 = 8'b0101_0000;		// 字符P
			2:	text_line_2 = 8'b0100_0111;		// 字符G
			3:	text_line_2 = 8'b0100_0001;		// 字符A
			4:	text_line_2 = 8'b0010_0000;		// 字符空
			5:	text_line_2 = 8'b0101_0011;		// 字符S
			6:	text_line_2 = 8'b0111_0100;		// 字符t
			7:	text_line_2 = 8'b0110_0001;		// 字符a
			8:	text_line_2 = 8'b0111_0010;		// 字符r
			9:	text_line_2 = 8'b0111_0100;		// 字符t
			10:	text_line_2 = 8'b0110_0101;		// 字符e
			11:	text_line_2 = 8'b0111_0010;		// 字符r
			default:text_line_2 = 8'b0;			
		endcase
	end
endmodule
