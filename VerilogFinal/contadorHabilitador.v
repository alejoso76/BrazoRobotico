`timescale 1ns / 1ps
//-------------------------------------------------------------------
module contadorHabilitador(
	input CLK,
    input [19:0] condiv,
    input [7:0] datosROM,
	output reg habilitador
);
reg [7:0] contAUX = 8'b0;
//-------------------------------------------------------------------
always @(posedge CLK)
	begin
        habilitador <= 0;
		//Alcanza el limite (20 ms) y regresa a 0
		if(condiv == 999999)
            begin
                if (contAUX == datosROM)
                    begin
                        habilitador <= 1;
                        contAUX <= 0;
            end
		else
		//Suma de 1 en 1
			condiv <= condiv+1;
        end
	end
endmodule
