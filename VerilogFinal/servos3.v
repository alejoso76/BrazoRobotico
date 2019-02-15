`timescale 1ns / 1ps
//-------------------------------------------------------------------
module servos3(
	input CLK,
	//input SW1,
	//input SW2,
	//input SW3,
	output PWM1,
	output PWM2,
	output PWM3
);

//-------------------------------------------------------------------
wire [19:0] comparadorWire; // Conexion con el contador
wire [16:0] temPWMWire1; // Valor para determinar el angulo 1
wire [16:0] temPWMWire2; // Valor para determinar el angulo 2
wire [16:0] temPWMWire3; // Valor para determinar el angulo 3
wire [7:0] addressWire; //Direccion
wire [31:0] datosWire;	//Datos de salida de la memoria ROM
wire enablerAddress;

//-------------------------------------------------------------------
// Instancia del contador - 20 ms
contador counter(
	.CLK(CLK),
	.condiv(comparadorWire)
);

//Instancia next address enabler
addressCounter addrCount(
	.CLK(CLK),
	.nextAddrEnabler(enablerAddress), 
	.address(addressWire)
);

//Instancia de la memoria ROM
memoriaROM mem1(
	.CLK(CLK),
	.address(addressWire), 
	.DATOS(datosWire) 
);

//Instancia
nextAddressEnabler tiempo(
	.CLK(CLK),
	.counter(comparadorWire),
	.dataTimeROM(datosWire[7:0]), 
	.enabler(enablerAddress) // habilitador para pasar a la siguiente posición
);

//Motor 1-------------------------------------------------------------------
angulo angulo1(
	.CLK(CLK),
	.address(datosWire[31:24]),
	.temPWM(temPWMWire1)
);
comparador comparador1(
	.CLK(CLK),
	.a(comparadorWire),
	.b(temPWMWire1),
	.PWM(PWM1)
);

//Motor 2-------------------------------------------------------------------
angulo angulo2(
	.CLK(CLK),
	.address(datosWire[23:16]),
	.temPWM(temPWMWire2)
);
comparador comparador2(
	.CLK(CLK),
	.a(comparadorWire),
	.b(temPWMWire2),
	.PWM(PWM2)
);

//Motor 3-------------------------------------------------------------------
angulo angulo3(
	.CLK(CLK),
	.address(datosWire[15:8]),
	.temPWM(temPWMWire3)
);
comparador comparador3(
	.CLK(CLK),
	.a(comparadorWire),
	.b(temPWMWire3),
	.PWM(PWM3)
);
endmodule
