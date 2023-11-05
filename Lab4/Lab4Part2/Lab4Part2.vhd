-- Lab4PartII 

-- Students
--		Deepak Neupane
--		Hansen Shamoon
--
-- In this lab, we are to implement an alternative way to specify a counter
-- by using a register and adding 1 to it's value. 
-- 		Q <= Q + 1  (incrementing register value as counter)

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Lab4Part2 IS
    PORT (CLK,RST : IN  STD_LOGIC;
			 HEX0,HEX1,HEX2,HEX3 : OUT STD_LOGIC_VECTOR(0 to 6);
          COUNT : OUT  STD_LOGIC_VECTOR (15 downto 0));
END Lab4Part2;

ARCHITECTURE Behavior OF Lab4Part2 IS

	FUNCTION to_7segment (bin : STD_LOGIC_VECTOR(0 to 3))	RETURN STD_LOGIC_VECTOR IS
		VARIABLE segment_pattern : STD_LOGIC_VECTOR(6 DOWNTO 0);
		BEGIN
			 -- Default to blank display
			 segment_pattern := "1111111";

			 CASE bin IS
				WHEN "0000" => segment_pattern := "0000001"; -- 0
				WHEN "0001"  => segment_pattern := "1001111"; -- 1
				WHEN "0010"  => segment_pattern := "0010010"; -- 2
				WHEN "0011"  => segment_pattern := "0000110"; -- 3
				WHEN "0100"  => segment_pattern := "1001100"; -- 4
				WHEN "0101"  => segment_pattern := "0100100"; -- 5
				WHEN "0110"  => segment_pattern := "0100000"; -- 6
				WHEN "0111"  => segment_pattern := "0001111"; -- 7
				WHEN "1000"  => segment_pattern := "0000000"; -- 8
				WHEN "1001"  => segment_pattern := "0000100"; -- 9
				WHEN "1010"  => segment_pattern := "0001000"; -- 10
				WHEN "1011"  => segment_pattern := "1100000"; -- 11
				WHEN "1100"  => segment_pattern := "0110001"; -- 12
				WHEN "1101"  => segment_pattern := "1000010"; -- 13
				WHEN "1110"  => segment_pattern := "0110000"; -- 14
				WHEN "1111"  => segment_pattern := "0111000"; -- 15
				WHEN OTHERS => segment_pattern := "1111111"; -- Blank display for other values
			END CASE;
		RETURN segment_pattern;
	END FUNCTION to_7segment;

	SIGNAL C_temp: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
	
BEGIN	
	PROCESS (CLK,RST)
	BEGIN

	IF (RST = '1')	THEN
		C_temp <= "0000000000000000";
	ELSIF clk ='1' and CLK'event THEN
		C_temp <= C_temp + "0000000000000001";
	END IF;
	
	COUNT <= C_temp;
	
	END PROCESS;

	HEX0 <= to_7segment(C_temp(3 downto 0));
	HEX1 <= to_7segment(C_temp(7 downto 4));
	HEX2 <= to_7segment(C_temp(11 downto 8));
	HEX3 <= to_7segment(C_temp(15 downto 12));
	
END Behavior;
