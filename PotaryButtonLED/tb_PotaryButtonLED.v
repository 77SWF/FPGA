`timescale 1ps / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:56 03/09/2021
// Design Name:   PotaryButtonLED
// Module Name:   C:/Users/susu/Documents/mygithub/FPGA/PotaryButtonLED/tb_PotaryButtonLED.v
// Project Name:  PotaryButtonLED
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PotaryButtonLED
//
// Dependencies:  
//  
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
////////////////////////////////////////////////////////////////////////////////

module tb_PotaryButtonLED;

	// Inputs
	reg rotary_a;
	reg rotary_b;
	reg SlideSwitch_3;
	reg clock;

	// Outputs
	wire [7:0] LEDout;

	// Instantiate the Unit Under Test (UUT)
	PotaryButtonLED uut (
		.rotary_a(rotary_a), 
		.rotary_b(rotary_b), 
		.SlideSwitch_3(SlideSwitch_3), 
		.clock(clock), 
		.LEDout(LEDout)
	);

	initial begin
		clock = 1'b1;
		forever #1 clock=~clock;
	end
	
	initial begin
		rotary_a = 1'b1;
		forever #35 rotary_a=~rotary_a;
	end
	
	initial begin
		rotary_b = 1'b0;
		forever #15 rotary_b=~rotary_b;
	end 
	
	initial begin
		SlideSwitch_3 = 1'b1;
		forever #100 SlideSwitch_3=~SlideSwitch_3;
	end
      
endmodule

