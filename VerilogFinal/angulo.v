`timescale 1ns / 1ps
//-------------------------------------------------------------------
module angulo(
	input CLK,
	input [7:0] address, //0° - 180°
	output reg[16:0] temPWM //Ancho de pulso
    );

//-------------------------------------------------------------------
reg[19:0] CONTAUX=20'b0;

always @(posedge CLK) 
	begin
		if(CONTAUX == 999999)
		begin
			temPWM <= 125000 + (address * 392); //Valor ancho de pulso máximo -> 180°
			CONTAUX <= 0;
		end	
		else
			CONTAUX <= CONTAUX + 1; //Valor ancho de pulso mínimo -> 0°
	end


endmodule
