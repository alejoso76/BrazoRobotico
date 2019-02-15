`timescale 1ns / 1ps
//-------------------------------------------------------------------
module nextAddressEnabler(
    input CLK,
    input [19:0] counter,
    input [7:0] dataTimeROM,
    output reg enabler
    );
	 
reg[7:0] contAUX = 8'b0; //Contador auxiliar
//-------------------------------------------------------------------
always @(posedge CLK)
begin
		enabler <= 0;
		if(counter == 999999) //20 ms
			begin
				if(contAUX == dataTimeROM) //Si contAUX es igual a la address que viene de memoria 
					begin
						enabler <= 1; //Habilitador para el siguiente address
						contAUX <= 0; //Alcanza el limite y regresa a 0
				end
				else
					contAUX <= contAUX +1; 	//Suma de 1 en 1
	
			end
		
	end
endmodule
