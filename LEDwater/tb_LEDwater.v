`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:33:59 03/05/2021
// Design Name:   LEDwater
// Module Name:   C:/Users/susu/Documents/mygithub/FPGA/LEDwater/tb_LEDwater.v
// Project Name:  LEDwater
// Target Device:  
// Tool versions:   
// Description: 
// 
// Verilog Test Fixture created by ISE for module: LEDwater
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
 
module tb_LEDwater;

	// Inputs
	reg clock;

	// Outputs
	wire [7:0] LEDout;

	// Instantiate the Unit Under Test (UUT)
	LEDwater uut (
		.LEDout(LEDout), 
		.clock(clock)  
	);
	

	initial begin
		// Initialize Inputs
		clock = 1'b1;

		// Wait 100 ns for global reset to finish
		forever #1 clock = ~clock;
        
		// Add stimulus here
	end
      
endmodule

