`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:26:46 02/28/2021
// Design Name:   Control_LED
// Module Name:   C:/Users/susu/Documents/mygithub/FPGA/Control_LED/tb_Control_LED.v
// Project Name:  Control_LED
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_LED
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Control_LED;

	// Inputs
	reg [3:0] button;
	reg [3:0] slide;
	reg clock;

	// Outputs
	wire [7:0] LEDOut;

	// Instantiate the Unit Under Test (UUT)
	Control_LED uut (
		.LEDOut(LEDOut), 
		.button(button), 
		.slide(slide), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		button = 0;
		slide = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

