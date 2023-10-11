--Lab Three Part III

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- 
--

LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY LabThreePartIII is
    PORT (  SW: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				clock: IN STD_LOGIC;
				reset: IN STD_LOGIC; -- active-low asynchronous reset
				Cout: OUT STD_LOGIC;
				HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(0 TO 6));
END LabThreePartIII;

ARCHITECTURE Behavior of LabThreePartIII is
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
	
	COMPONENT BinToHexDisplay 
			PORT (binaryInput	:	IN	STD_LOGIC_VECTOR(3 downto 0);
					hexDisplayOutput	:	OUT STD_LOGIC_VECTOR(6 downto 0));
	END COMPONENT;
	COMPONENT IntToHexDisplay 
			PORT (intInput	:	IN	integer;
					hexDisplayOutput	:	OUT STD_LOGIC_VECTOR(6 downto 0));
	END COMPONENT;
	
	SIGNAL A: STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	SIGNAL B: STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	SIGNAL SUM: STD_LOGIC_VECTOR(8 DOWNTO 0) := "000000000";
BEGIN
	A <= SW(7 DOWNTO 0);
	B <= SW(7 DOWNTO 0);
	
	SUM <= std_logic_vector(unsigned("0" & A) + unsigned("0" & B));
	Cout <= SUM(8);
	
	display_logic: PROCESS(A, B, SUM, SW)
	BEGIN
		-- need some kind of logic to store values here
		
	END PROCESS;
	
	-- take 8 bit inputs store in A, display in HEX3-2
	HEX2 <= to_7segment(to_integer(unsigned(A(3 DOWNTO 0))));
	HEX3 <= to_7segment(to_integer(unsigned(A(7 DOWNTO 4))));
	
	-- take another 8 bit inputs, store in B, display in HEX 1-0
	HEX0 <= to_7segment(to_integer(unsigned(B(3 DOWNTO 0))));
	HEX1 <= to_7segment(to_integer(unsigned(B(7 DOWNTO 4))));
	
	-- Add the two numbers and store in S, display in HEX 5-4, show Cout in LEDR(0)
	HEX4 <= to_7segment(to_integer(unsigned(SUM(3 DOWNTO 0))));
	HEX5 <= to_7segment(to_integer(unsigned(SUM(7 DOWNTO 4))));
	
	
END Behavior;
