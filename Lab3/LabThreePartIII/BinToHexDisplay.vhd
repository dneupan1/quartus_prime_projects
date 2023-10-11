--Lab Three Part III

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- 
--

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BinToHexDisplay IS
PORT	( binaryInput	:	IN	std_logic_vector(3 DOWNTO 0);
			hexDisplayOutput:	OUT	std_logic_vector(6 DOWNTO 0));
end BinToHexDisplay;

ARCHITECTURE behavior OF BinToHexDisplay IS
BEGIN
	WITH binaryInput SELECT
		hexDisplayOutput <="0000001" WHEN "0000", -- 0
				"1001111" WHEN "0001", -- 1
				"0010010" WHEN "0010", -- 2
				"0000110" WHEN "0011", -- 3
				"1001100" WHEN "0100", -- 4
				"0100100" WHEN "0101", -- 5
				"0100000" WHEN "0110", -- 6
				"0001111" WHEN "0111", -- 7
				"0000000" WHEN "1000", -- 8
				"0000100" WHEN "1001", -- 9
				"0001000" WHEN "1010", -- A
				"1100000" WHEN "1011", -- b
				"0110001" WHEN "1100", -- C
				"1000010" WHEN "1101", -- d
				"0110000" WHEN "1110", -- E
				"0111000" WHEN "1111", -- F
				"1111111" WHEN OTHERS; -- turn off all LEDs
end behavior;