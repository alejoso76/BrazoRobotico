`timescale 1ns / 1ps
//-------------------------------------------------------------------
module servos3(
	input CLK,
	input SW1,
	input SW2,
	input SW3,
	output PWM1,
	output PWM2,
	output PWM3
);

//-------------------------------------------------------------------
wire [19:0] a_net; // Conexion con el contador
wire [16:0] value_net1; // Valor para determinar el angulo 1
wire [16:0] value_net2; // Valor para determinar el angulo 2
wire [16:0] value_net3; // Valor para determinar el angulo 3

//-------------------------------------------------------------------
// Instancia del contador - 20 ms
contador counter(
	.CLK(CLK),
	.condiv(a_net)
);

//Motor 1-------------------------------------------------------------------
angulo angulo1(
	.CLK(CLK),
	.SW1(SW1),
	.temPWM(value_net1)
);
comparador comparador1(
	.CLK(CLK),
	.a(a_net),
	.b(value_net1),
	.PWM(PWM1)
);

//Motor 2-------------------------------------------------------------------
angulo angulo2(
	.CLK(CLK),
	.SW1(SW2),
	.temPWM(value_net2)
);
comparador comparador2(
	.CLK(CLK),
	.a(a_net),
	.b(value_net2),
	.PWM(PWM2)
);

//Motor 3-------------------------------------------------------------------
angulo angulo3(
	.CLK(CLK),
	.SW1(SW3),
	.temPWM(value_net3)
);
comparador comparador3(
	.CLK(CLK),
	.a(a_net),
	.b(value_net3),
	.PWM(PWM3)
);
endmodule
