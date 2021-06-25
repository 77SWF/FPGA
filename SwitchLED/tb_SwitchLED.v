`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:41 02/28/2021
// Design Name:   SwitcLED
// Module Name:   C:/Users/susu/Documents/mygithub/FPGA/SwitchLED/tb_SwitchLED.v
// Project Name:  SwitchLED
// Target Device:  
// Tool versions:  
// Description: 
// 
// Verilog Test Fixture created by ISE for module: SwitcLED
//
// Dependencies:
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_SwitchLED; 

	// Inputs
	reg [3:0] SlideSwitch; 

	// Outputs 
	wire [7:0] LEDOut; 
 
	// Instantiate the Unit Under Test (UUT)
	SwitcLED uut (
		.LEDOut(LEDOut), 
		.SlideSwitch(SlideSwitch)
	);

	initial begin
		// Initialize Inputs
		SlideSwitch = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

