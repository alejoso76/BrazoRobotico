`timescale 1ns / 1ps
//-------------------------------------------------------------------
module servos3(
	input CLK,
	input [7:0] Address,
	output PWM1,
	output PWM2,
	output PWM3
);

//-------------------------------------------------------------------
wire [19:0] a_net; // Conexion con el contador
wire [16:0] value_net1; // Valor para determinar el angulo 1
wire [16:0] value_net2; // Valor para determinar el angulo 2
wire [16:0] value_net3; // Valor para determinar el angulo 3
wire [31:0] data_net; //Direccion de memoria


//-------------------------------------------------------------------
// Instancia modula generador de Address
MemoriaTrayectoria memoriaROM(
    .CLK(CLK),
	 .a_net
    .Tiempo(data_net[7:0]),
    .Address(Address)
    );

//LOGICA: a_net es el contador de 20 ms, cada que cuente estos 20 ms le suma al contador de tiempo. Cuando este contador sea igual a el tiempo de data_net, se resetea este contador y se le suma a address
//Cambiar POS por Address
//Contador a_net por cont 20 ms
//-------------------------------------------------------------------
// Instancia Memoria
MemoriaTrayectoria memoriaROM(
    .CLK(CLK),
    .Address(Address),
    .DataRead(data_net)
    );


//-------------------------------------------------------------------
// Instancia del contador - 20 ms
contador counter(
	.CLK(CLK),
	.condiv(a_net)
);
  
//Motor 1-------------------------------------------------------------------
anguloPOS angulo1(
	.CLK(CLK),
	.POS(data_net[31:24]),
	.temPWM(value_net1)
);
comparador comparador1(
	.CLK(CLK),
	.a(a_net),
	.b(value_net1),
	.PWM(PWM1)
);

//Motor 2-------------------------------------------------------------------
anguloPOS angulo2(
	.CLK(CLK),
	.POS(data_net[23:16]),
	.temPWM(value_net2)
);
comparador comparador2(
	.CLK(CLK),
	.a(a_net),
	.b(value_net2),
	.PWM(PWM2)
);

//Motor 3-------------------------------------------------------------------
anguloPOS angulo3(
	.CLK(CLK),
	.POS3(data_net[15:8]),
	.temPWM(value_net3)
);
comparador comparador3(
	.CLK(CLK),
	.a(a_net),
	.b(value_net3),
	.PWM(PWM3)
);
endmodule
