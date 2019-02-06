`timescale 1ns / 1ps
//-------------------------------------------------------------------
module comparador(
	input CLK,
	input [19:0] a, //Entra del contador
	input [16:0] b, //Ancho de pulso
	output reg PWM
);

//-------------------------------------------------------------------
always @(posedge CLK)
	begin
		if(a<b)
		//Si a esta dentro del ancho de pulso
			PWM <= 1;
		else 
			PWM <= 0; 
			
	end

endmodule
