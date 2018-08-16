----------------------------------------------------------------------------------
-- Company: Universidad Tecnológica de Pereira
-- Engineer: Alejandro Osorio - Valentina Rojas
-- 
-- Create Date:    09:39:03 08/15/2018 
-- Design Name:    
-- Module Name:    servomotor - Behavioral 
-- Project Name:   Brazo robótico
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- :) 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity servomotor is
	port ( 
		Clock 		: in  std_logic;
		Reset 		: in  std_logic;
		PW 		 	: in  std_logic_vector(3 downto 0);
		PWM	 		: out  std_logic
	);
end servomotor;

architecture servomotor_Arquitectura of servomotor is

signal Counter1s: std_logic_vector(25 downto 0) := (others=>'0'); --25 bits - 50 millones
		--1 s
signal enabler: std_logic := '0'; --Habilitador de 1 segundo activo
		--16 s
signal CounterTotal: std_logic_vector(3 downto 0) := (others=>'0'); --Ancho total de la señal


begin

-- Habilita la señal cada segundo
process (Clock, Reset)
begin
	if (Reset = '0') then
		Counter1s <= (others=>'0');
		enabler <= '0';
   elsif rising_edge(Clock) then  
      Counter1s <= Counter1s + 1;
		enabler <= '0';
		--50 mil para motor, 50 millones para LED
		if (Counter1s = 49999999) then
			Counter1s <= (others=>'0');
			enabler <= '1';
		end if;
   end if;
end process;


process (Clock, Reset)
begin
	if (Reset = '0') then
		CounterTotal <= (others=>'0');
   elsif rising_edge(Clock) then 
		if (enabler = '1') then
			CounterTotal <= CounterTotal + 1; --Aumenta el ancho de pulso
			if (CounterTotal = 15) then
				CounterTotal <= (others=>'0');
			end if;
		end if;
   end if;
end process;

PWM <= '1' when (PW <= CounterTotal) else '0'; --Movimiento del motor

end servomotor_Arquitectura;
