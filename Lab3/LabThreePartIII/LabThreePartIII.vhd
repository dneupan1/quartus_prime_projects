library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


entity LabThreePartIII is
    Port (
        KEY0 : in STD_LOGIC; -- Active-low reset
        KEY1 : in STD_LOGIC; -- Clock input
        SW   : in STD_LOGIC_VECTOR(7 downto 0); -- Input switches
        HEX1, HEX0, HEX2, HEX3, HEX4, HEX5, HEX6 : out STD_LOGIC_VECTOR(0 to 6);
        LEDR : out STD_LOGIC_VECTOR(7 downto 0)
    );
end LabThreePartIII;

architecture Behavioral of LabThreePartIII is
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
	
    signal A, B : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	 signal S : STD_LOGIC_VECTOR(8 downto 0) := "000000000";
    signal carryout : STD_LOGIC;
begin
    process(KEY0, KEY1, S, SW)
    begin
        if KEY0 = '0' then
            -- Reset
            A <= (others => '0');
            B <= (others => '0');
				S <= (others => '0');
            carryout <= '0';
        elsif rising_edge(KEY1) then
            -- Clock input
            B <= A; -- Store A in B
				A <= SW;
            S <= (others => '0'); -- Clear S
				S <= std_logic_vector(unsigned("0" & A) + unsigned("0" & B));
				carryout <= S(8);
        end if;
    end process;

    -- take 8 bit inputs store in A, display in HEX3-2
	HEX2 <= to_7segment(to_integer(unsigned(A(3 DOWNTO 0))));
	HEX3 <= to_7segment(to_integer(unsigned(A(7 DOWNTO 4))));
	
	-- take another 8 bit inputs, store in B, display in HEX 1-0
	HEX0 <= to_7segment(to_integer(unsigned(B(3 DOWNTO 0))));
	HEX1 <= to_7segment(to_integer(unsigned(B(7 DOWNTO 4))));
	
	-- Add the two numbers and store in S, display in HEX 5-4, show Cout in LEDR(0)
	HEX4 <= to_7segment(to_integer(unsigned(S(3 DOWNTO 0))));
	HEX5 <= to_7segment(to_integer(unsigned(S(7 DOWNTO 4))));

    --carryout signal to LEDR(0)
    LEDR <= "00000001" when carryout = '1' else "00000000";
end Behavioral;