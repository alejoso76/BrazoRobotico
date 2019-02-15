`timescale 1ns / 1ps
//-------------------------------------------------------------------
module addressCounter(
    input CLK,
    input nextAddrEnabler,
    output reg [7:0] address
    );
//-------------------------------------------------------------------
always @(posedge CLK)
	begin
		if(nextAddrEnabler == 1)
			address <= address + 1; //aumento la posición en 1
	
	end

endmodule
