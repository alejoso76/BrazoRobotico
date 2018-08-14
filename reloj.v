`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:57 08/13/2018 
// Design Name: 
// Module Name:    reloj 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module reloj(input clk);

localparam N = 26;
reg [N-1:0] slow_clk = 0;
reg [7:0] countsec = 0;
  
wire enable;

always @ (posedge clk)
  if (slow_clk == 26'd49) slow_clk <= 8'b0;
    else  slow_clk <= slow_clk + 8'b1;

assign enable = (slow_clk == 26'd49);

always @ (posedge clk)
  if (enable == 1'b1)
    if (countsec == 8'b00111011) countsec <= 8'b0;
    else  countsec <= countsec + 8'b1;

endmodule
