`timescale 1ns / 1ps
//-------------------------------------------------------------------
module anguloPOS(
	input CLK,
	input [7:0] POS,
	output reg[16:0] temPWM = 25000 //Se inicializa en el minimo //Ancho de pulso
    );

reg = [19:0] DIV = 20'b0;
//-------------------------------------------------------------------
always @(posedge CLK) 
	begin
		if (DIV = 999999)
			begin
				temPWM <= 250000 + (POS * 392);
				DIV <= 0;
			end
		else
			DIV <= DIV + 1;
	end


endmodule
