`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:13:43 08/13/2018 
// Design Name: 
// Module Name:    stepper 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module stepper(
    input clk,
    input onoff,  //Habilita el movimiento del motor
    input cwccw, //Sentido de movimiento
    input enabler, //Habilitador cada 1 seg
	 input fushs, //Paso completo o medio paso
	 input reseteo, //Resetea al estado inicial
    input [3:0] state, //Estado
    output [3:0] stateout, //Estado
    output w1,
    output w2,
    output w3,
    output w4
    );

//type state is(reset,first, second, third, fourth, half1,half2,half3,half4);

reg  psstate;
reg nxstate; /*: state*/;

localparam state1 = 4'b1;
localparam state2 = 4'b2;
localparam state3 = 4'b4;
localparam state4 = 4'b8;

//signal  motor:std_logic_vector(3 downto 0);

/*
process (clk_s,rst)

begin

if Rst = '0' then

Ps_state <= reset;

elsif clk_s'event and clk_s='1' then

if Step_en = '1' then

Ps_state <= Nx_state;

end if;

end if;

end process;

 

process (ps_state,CW_CCW,Step_en,rst,FS_HS)

begin

case(ps_state) is

when reset  =>                                                        

Nx_state  <= first;

when first  =>                                                        

if FS_HS = '0' then ---FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state <= second;   ----assigning each step of motor rotation

else

Nx_state  <= fourth;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half1;

else

Nx_state  <= half4;

end if;

end if;

when half1 =>                                                         

if CW_CCW = '1' then

Nx_state  <= second;

else

Nx_state  <= first;

end if;

when second  =>                                                       

if FS_HS = '0' then-- FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state  <= third;

else

Nx_state  <= first;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half2;

else

Nx_state  <= half1;

end if;

end if;

when half2  =>                                                        

if CW_CCW = '1' then

Nx_state  <= third;

else

Nx_state  <= second;

end if;

when third =>                                                         

if FS_HS = '0' then -- FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state <= fourth;

else

Nx_state  <= second;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half3;

else

Nx_state  <= half2;

end if;

end if;

when half3  =>                                                        

if CW_CCW = '1' then

Nx_state  <= fourth;

else 

Nx_state  <= third;

end if;

when fourth =>                                                        

if FS_HS = '0' then  -- FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state  <= first;

else

Nx_state  <= third;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half4;

else

Nx_state  <= half3;

end if;

end if;

when half4  =>                                                        

if CW_CCW = '1' then

Nx_state  <= first;

else

Nx_state  <= fourth;

end if;

when others  => Nx_state  <= reset;

end case;

end process;

process(ps_state)

begin

case  ps_state is

when reset  =>

Motor  <= "0000";    ----assigning motor control on/off

when first  =>                                                        

Motor <= "1000";

when half1 =>                                                         

Motor  <= "1100";

when second  =>                                                       

Motor  <= "0100";

when half2  =>                                                        

Motor  <= "0110";

when third  =>

Motor  <= "0010";

when half3  =>                                                        

Motor  <= "0011";

when fourth  =>                                                       

Motor <= "0001";

when half4 =>

Motor <= "1001";

when others =>

Motor <= "0000";

end case;

end process;
*/

endmodule
