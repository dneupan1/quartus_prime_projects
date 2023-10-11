--Lab One - Part V

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- This program takes 6 digit binary inputs from board switches and 
-- displays the binary equivalent of it on the board. For that, we
-- simply divide the given input by 10 and display the quotient and 
-- remainder in the hex displays.
--


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;


-- Four Bit Adder (Top Level Entity) 
ENTITY LabTwoPartVI is
    PORT ( SW : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			  HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW3 to SW0
			  HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6) -- 7-segment display for SW7 to SW4
			  );
END LabTwoPartVI;

ARCHITECTURE Behavioral of LabTwoPartVI is

	FUNCTION to_7segment (bin : integer) RETURN STD_LOGIC_VECTOR IS
		VARIABLE segment_pattern : STD_LOGIC_VECTOR(6 DOWNTO 0);
		BEGIN
			 -- Default to blank display
			 segment_pattern := "1111111";

			 CASE bin IS
				 WHEN 0 => segment_pattern := "0000001"; -- 0
				 WHEN 1 => segment_pattern := "1001111"; -- 1
				 WHEN 2 => segment_pattern := "0010010"; -- 2
				 WHEN 3 => segment_pattern := "0000110"; -- 3
				 WHEN 4 => segment_pattern := "1001100"; -- 4
				 WHEN 5 => segment_pattern := "0100100"; -- 5
				 WHEN 6 => segment_pattern := "0100000"; -- 6
				 WHEN 7 => segment_pattern := "0001111"; -- 7
				 WHEN 8 => segment_pattern := "0000000"; -- 8
				 WHEN 9 => segment_pattern := "0000100"; -- 9
				 WHEN OTHERS => segment_pattern := "1111111"; -- Blank display for other values
			END CASE;
		RETURN segment_pattern;
	END FUNCTION to_7segment;
	
	SIGNAL input: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
BEGIN
    input <= SW;
    display_logic: process(input)
    begin
        HEX1 <= to_7segment(to_integer(unsigned(input)) / 10); -- display the integer div result
        HEX0 <= to_7segment(to_integer(unsigned(input)) REM 10); -- display the remainder
    end process;     
END Behavioral;

