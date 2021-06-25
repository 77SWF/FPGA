`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:31:06 03/23/2021
// Design Name:   counter_scope
// Module Name:   C:/Users/susu/Documents/mygithub/FPGA/Counter_6bit_Scope/tb_counter_scope.v
// Project Name:  Counter_6bit_Scope
// Target Device:  
// Tool versions:  
// Description: 
// 
// Verilog Test Fixture created by ISE for module: counter_scope
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  
////////////////////////////////////////////////////////////////////////////////

module tb_counter_scope;

	// Inputs
	reg clock;
	reg rst_n;
	reg dir;

	// Outputs
	wire [5:0] LEDOut;

	// Instantiate the Unit Under Test (UUT)
	counter_scope uut (
		.LEDOut(LEDOut), 
		.clock(clock), 
		.rst_n(rst_n), 
		.dir(dir)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0; 
		dir = 0;
		#10 dir =1;
		#20 rst_n = 1; 
	end  
	
	initial
	begin 
		clock = 0;
		forever #1 clock = ~clock;
	end
      
endmodule

