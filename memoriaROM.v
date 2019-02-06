`timescale 1ns / 1ps
//-------------------------------------------------------------------

module memoriaROM(
    input CLK,
    input [7:0] Address,
    output [31:0] DataRead
    );

		//Servomotor 1 [31:24]
		//Servomotor 2 [23:16]
		//Servomotor 3 [15:8]
		//Tiempo [7:0]	 
	 
//-------------------------------------------------------------------
always @(posedge CLK)
	begin                   
		case(Address)				//    Servo1  Servo2   Servo3  Tiempo
			                  //   ((((((((--------........xxxxxxxx
									
			//Servomotor 1, 4 posiciones: 1 cada 60°
			8'b00000000: DataRead = 32'b00000000000000000000000001100100; //t=X*20ms, en este caso t=100*2ms=2000ms=2s
			8'b00000001: Address = 32'b00111100000000000000000001100100;
			8'b00000010: Address = 32'b01111000000000000000000001100100;
			8'b00000011: Address = 32'b11111111000000000000000001100100;
			
			//Servomotor 2, 4 posiciones: 1 cada 60°
			8'b00000100: Address = 32'b00000000000000000000000001100100;
			8'b00000101: Address = 32'b00000000001111000000000001100100;
			8'b00000110: Address = 32'b00000000011110000000000001100100;
			8'b00000111: Address = 32'b00000000111111110000000001100100;
			
			//Servomotor 3, 4 posiciones: 1 cada 60°
			8'b00001000: Address = 32'b00000000000000000000000001100100;
			8'b00001001: Address = 32'b00000000000000000011110001100100;
			8'b00001010: Address = 32'b00000000000000000111100001100100;
			8'b00001011: Address = 32'b00000000000000001111111101100100;
			
			//Posicion por defecto cuando no hay input o es un input distinto a los especificados
			default: Address = 32'b00000000000000000000000000000000;
		endcase
		end
endmodule
