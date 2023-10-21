--Lab One - Part V

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- This lab is to implement an alternate approach to four bit numbers and
-- displaying them in the hex display.
--


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.ALL;


-- Four Bit Adder (Top Level Entity) 
ENTITY LabTwoPartV is
    PORT ( SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			  LEDR9 : OUT STD_LOGIC;
			  HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW3 to SW0
			  HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW7 to SW4
			  HEX5 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW3 to SW0
			  HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6)); -- 7-segment display for SW7 to SW4
END LabTwoPartV;

ARCHITECTURE Behavioral of LabTwoPartV is

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
	
	SIGNAL cin: STD_LOGIC;
	SIGNAL A, B, Z0, T0, C1, S0, S1, C0: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	SIGNAL sum : STD_LOGIC_VECTOR(4 downto 0);
	
BEGIN 
	A <= SW(7 DOWNTO 4);
	B <= SW(3 DOWNTO 0);
	cin <= SW(8);
	
	c0(0) <= cin;
	sum <=("0" & A) + ("0" & B) + ("0" & C0);
	T0 <= sum(3 downto 0);
	 -- display logic
	display_logic: process(A, B, Cin, T0, Z0, C1)

	begin
		-- Comparator logic for input A
		if A < "1001" then
			HEX5 <= to_7segment(A);		
		else
			HEX5 <= "1111111";	
		end if;

		-- Comparator logic for input B
		if B < "1001" then
			HEX3 <= to_7segment(B);
		else	
			HEX3 <= "1111111";
		end if;

		-- Set LEDR9 based on the validity of both A and B
		if A > "1001" or B > "1001" then
			LEDR9 <= '1';
		else
			LEDR9 <= '0';
		end if;
		
		if T0 > "1001" then
			Z0 <= "1010";
			C1 <= "0001";
		else
			Z0 <= "0000";
			C1 <= "0000";
		end if;
		
		S0 <= T0 - Z0;
		S1 <= C1;

	 end process;

    -- Logic for HEX1 
    HEX1 <= to_7segment(S1);

    -- Logic for HEX0 
    HEX0 <= to_7segment(S0);
	 
END Behavioral;
