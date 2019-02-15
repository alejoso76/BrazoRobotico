`timescale 1ns / 1ps
//-------------------------------------------------------------------
module contador(
	input CLK,
	output reg[19:0] condiv = 20'b0
);

//-------------------------------------------------------------------
always @(posedge CLK)
	begin
		//Alcanza el limite y regresa a 0
		if(condiv == 999999)
			condiv <= 0;
		else
		//Suma de 1 en 1
			condiv <= condiv+1;
	end
endmodule
