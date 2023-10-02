--Lab Two - Part I

--Students:
--	Hansen Shamoon 
--	Deepak Neupane
	
-- This program implements a simple switch to led display. 
-- Values set by switches SW7 to SW4 are displayed on HEX1 
-- and SW3 to SW0 are displayed on HEX0 respectively.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Part 1 code --
ENTITY LabTwoPartI IS
    PORT (
        SW   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW3 to SW0
        HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6)  -- 7-segment display for SW7 to SW4
    );
END ENTITY LabTwoPartI;

ARCHITECTURE Behavior OF LabTwoPartI IS 
    
    FUNCTION to_7segment (bin : STD_LOGIC_VECTOR(3 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
		VARIABLE segment_pattern : STD_LOGIC_VECTOR(6 DOWNTO 0);
		BEGIN
			 -- Default to blank display
			 segment_pattern := "1111111";

			 CASE bin IS
				 WHEN "0000" => segment_pattern := "0000001"; -- 0
				 WHEN "0001" => segment_pattern := "1001111"; -- 1
				 WHEN "0010" => segment_pattern := "0010010"; -- 2
				 WHEN "0011" => segment_pattern := "0000110"; -- 3
				 WHEN "0100" => segment_pattern := "1001100"; -- 4
				 WHEN "0101" => segment_pattern := "0100100"; -- 5
				 WHEN "0110" => segment_pattern := "0100000"; -- 6
				 WHEN "0111" => segment_pattern := "0001111"; -- 7
				 WHEN "1000" => segment_pattern := "0000000"; -- 8
				 WHEN "1001" => segment_pattern := "0000100"; -- 9
				 WHEN OTHERS => segment_pattern := "1111111"; -- Blank display for other values
			END CASE;
		RETURN segment_pattern;
	END FUNCTION to_7segment;


BEGIN
    HEX0 <= to_7segment(SW(3 DOWNTO 0));
    HEX1 <= to_7segment(SW(7 DOWNTO 4));
END ARCHITECTURE Behavior;
