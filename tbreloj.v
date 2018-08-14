`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:40 08/13/2018
// Design Name:   reloj
// Module Name:   C:/Users/mac/Desktop/BrazoRobotico/BrazoRobotico/tbreloj.v
// Project Name:  BrazoRobotico
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reloj
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tbreloj;
  
  reg clk = 1'b0;
  
  always #10 clk = ~clk;
  
  reloj digital_clock0 (.clk(clk));
  
  initial #100000 $finish;
  
  always begin 
    #10000 $display("tick");
    #10000 $display("tock");
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
                           
endmodule

