library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity modeloUnion is
    Port ( C1 : in  STD_LOGIC;
           C2 : in  STD_LOGIC;
           C3 : in  STD_LOGIC;
           R1 : in  STD_LOGIC;
           R2 : in  STD_LOGIC;
           R3 : in  STD_LOGIC;
           PWa1 : in  STD_LOGIC_VECTOR (7 downto 0);
           PWa2 : in  STD_LOGIC_VECTOR (7 downto 0);
           PWa3 : in  STD_LOGIC_VECTOR (7 downto 0);
           PWMa1 : out  STD_LOGIC;
           PWMa2 : out  STD_LOGIC;
           PWMa3 : out  STD_LOGIC);
end modeloUnion;

architecture Behavioral of modeloUnion is
--Motor 1
COMPONENT servomotor1
	PORT(
		Clock1 : IN std_logic;
		Reset1 : IN std_logic;
		PW1 : IN std_logic_vector(7 downto 0);          
		PWM1 : OUT std_logic
		);
	END COMPONENT;
	
--Motor 2
	COMPONENT servomotor2
	PORT(
		Clock2 : IN std_logic;
		Reset2 : IN std_logic;
		PW2 : IN std_logic_vector(7 downto 0);          
		PWM2 : OUT std_logic
		);
	END COMPONENT;

--Motor 3
	COMPONENT servomotor3
	PORT(
		Clock3 : IN std_logic;
		Reset3 : IN std_logic;
		PW3 : IN std_logic_vector(7 downto 0);          
		PWM3 : OUT std_logic
		);
	END COMPONENT;	
begin
--Motor 1
	Inst_servomotor1: servomotor1 PORT MAP(
		Clock1 => C1,
		Reset1 => R1,
		PW1 => PWa1,
		PWM1 => PWMa1
	);
	
--Motor 2
	Inst_servomotor2: servomotor2 PORT MAP(
		Clock2 => C2,
		Reset2 => R2,
		PW2 => PWa2,
		PWM2 => PWMa2
	);
	
--Motor 3	
	Inst_servomotor3: servomotor3 PORT MAP(
		Clock3 => C3,
		Reset3 => R3,
		PW3 => PWa3,
		PWM3 => PWMa3
	);
end Behavioral;

