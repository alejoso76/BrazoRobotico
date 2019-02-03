`timescale 1ns / 1ps
//-------------------------------------------------------------------
module angulo(
	input CLK,
	input SW1, //0° - 180°
	output reg[16:0] temPWM //Ancho de pulso
    );

//-------------------------------------------------------------------
always @(posedge CLK) 
	begin
		if(SW1 == 1)
			temPWM <= 125000; //Valor ancho de pulso máximo -> 180°
		else
			temPWM <= 25000; //Valor ancho de pulso mínimo -> 0°
	end


endmodule
