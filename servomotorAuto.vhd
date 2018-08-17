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

--En vez de switches, aumentar el movimiento automaticamente de 0 a 255 y luego otra vez a 0
entity servomotor is
	port ( 
		Clock 		: in  std_logic;
		Reset 		: in  std_logic;
		--PW 		 	: in  std_logic_vector(7 downto 0);
		Direction   : in std_logic;
		PWM	 		: out  std_logic
	);
end servomotor;

architecture servomotor_Arquitectura of servomotor is

signal Counter1s: std_logic_vector(25 downto 0) := (others=>'0'); --25 bits - 50 millones
		--1 s
signal enabler: std_logic := '0'; --Habilitador de 1 segundo activo
		--16 s
signal CounterTotal: std_logic_vector(7 downto 0) := (others=>'0'); --Ancho total de la señal

signal enablerAuto: std_logic := '0'; --Enabler para el movimiento automático del motor

signal PW: std_logic_vector(7 downto 0) := (others=>'0');

begin

-- Habilita la señal cada segundo
process (Clock, Reset)
begin
	if (Reset = '1') then
		Counter1s <= (others=>'0');
		enabler <= '0';
   elsif rising_edge(Clock) then  
      Counter1s <= Counter1s + 1;
		enabler <= '0';
		--50 mil para motor, 50 millones para LED
		if (Counter1s >= 4999) then
			Counter1s <= (others=>'0');
			enabler <= '1';
		end if;
   end if;
end process;

------------------------------------------------------
process (Clock, Reset)
begin
	if (Reset = '1') then
		CounterTotal <= (others=>'0');
   elsif rising_edge(Clock) then 
		if (enabler = '1') then
			CounterTotal <= CounterTotal + 1; --Aumenta el ancho de pulso
			if (CounterTotal >= 255) then
				enablerAuto <= '1';
				CounterTotal <= (others=>'0');
			end if;
		end if;
   end if;
end process;
-----------------------------------------------------
process (Clock, Reset)
begin
	if (Reset = '1') then
		PW <= (others=>'0');
   elsif rising_edge(Clock) then 
		if (enablerAuto = '1') then
			CounterTotal <= PW + 1; --Aumenta el ancho de pulso
			if (PW = 255) then
				--enablerAuto <= '1';
				PW <= PW;
			end if;
		end if;
   end if;
end process;
------------------------------------------------------

PWM <= '1' when (PW <= CounterTotal) else '0'; --Movimiento del motor

end servomotor_Arquitectura;