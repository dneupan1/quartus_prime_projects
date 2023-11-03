-- Lab4Part III
--
-- Students:
--		Deepak Neupane
--		Hansen Shamoon
--
-- In this lab, we are to design and implement a circuit that flashes digits 0 through 9
-- successively on the 7 segment display
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Lab4Part3 IS
    PORT (
				CLK: IN STD_LOGIC;
				HEX0 : out STD_LOGIC_VECTOR(0 to 6));
END Lab4Part3;

ARCHITECTURE Behavior OF Lab4Part3 IS
	
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
				WHEN 10 => segment_pattern := "0001000"; -- 10
				WHEN 11 => segment_pattern := "1100000"; -- 11
				WHEN 12 => segment_pattern := "0110001"; -- 12
				WHEN 13 => segment_pattern := "1000010"; -- 13
				WHEN 14 => segment_pattern := "0110000"; -- 14
				WHEN 15 => segment_pattern := "0111000"; -- 15
				WHEN OTHERS => segment_pattern := "1111111"; -- Blank display for other values
			END CASE;
		RETURN segment_pattern;
	END FUNCTION to_7segment;
	
   SIGNAL counter: integer := 0;
	SIGNAL display_digit: integer := 0;
BEGIN	
	PROCESS(CLK)
	BEGIN
		IF rising_edge(CLK) THEN
			counter <= counter + 1;
			IF counter = 49999999 THEN -- this is for a 50 MHz clock
				-- reset counter to 0
				counter <= 0;
				display_digit <= display_digit + 1;
				IF display_digit > 9 THEN
					-- if the digit to be displayed is 10 or above, reset
					-- it to begin at 0
					display_digit <= 0;
				END IF;
			END IF;
		END IF;
		HEX0 <= to_7segment(display_digit);
	END PROCESS;

END Behavior;