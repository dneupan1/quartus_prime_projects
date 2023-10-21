--Lab One - Part VI

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- This circuit implements a circuit that has two decimal digits X and Y. The sum
-- of these inputs are displayed onto the hex displays.
--


LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Four Bit Adder (Top Level Entity) 
ENTITY LabTwoPartIV is
    PORT ( X     : IN  STD_LOGIC_VECTOR(3 downto 0);
           Y     : IN  STD_LOGIC_VECTOR(3 downto 0);
           Cin   : IN  STD_LOGIC;
			  LEDR9 : OUT STD_LOGIC;
			  HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW3 to SW0
			  HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW7 to SW4
			  HEX5 : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment display for SW3 to SW0
			  HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6)); -- 7-segment display for SW7 to SW4
END LabTwoPartIV;

ARCHITECTURE Behavioral of LabTwoPartIV is

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

   SIGNAL second_disp : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL is_sum_greater_than_9 : STD_LOGIC;
	
	  COMPONENT FullAdder
		PORT ( 
				 a   : IN  STD_LOGIC;
				 b   : IN  STD_LOGIC;
				 ci  : IN  STD_LOGIC;
				 s   : OUT STD_LOGIC;
				 co  : OUT STD_LOGIC
			 );
		END COMPONENT;
		
    signal c : STD_LOGIC_VECTOR(4 downto 0);
	 signal sum: STD_LOGIC_VECTOR(4 downto 0);
BEGIN
	
    c(0) <= Cin;
    FA0: FullAdder port map(a => X(0), b => Y(0), ci => c(0), s => Sum(0), co => c(1));
    FA1: FullAdder port map(a => X(1), b => Y(1), ci => c(1), s => Sum(1), co => c(2));
    FA2: FullAdder port map(a => X(2), b => Y(2), ci => c(2), s => Sum(2), co => c(3));
    FA3: FullAdder port map(a => X(3), b => Y(3), ci => c(3), s => Sum(3), co => c(4));
	 
	 sum(4) <= c(4);
	 
	 -- display logic
	 display_logic: process(X, Y, sum, second_disp)

	begin
		 -- Comparator logic for input X
		 if X <= "1001" then
			  HEX5 <= to_7segment(X(3 DOWNTO 0));
		 else
			  HEX5 <= "1111111";
		 end if;

		 -- Comparator logic for input Y
		 if Y <= "1001" then
			  HEX3 <= to_7segment(Y(3 DOWNTO 0));
		 else
			  HEX3 <= "1111111";
		 end if;

		 -- Set LEDR9 based on the validity of both X and Y
		 if X > "1001" or Y > "1001" then
			LEDR9 <= '1';
		 else
			LEDR9 <= '0';
		 end if;

		  -- Handle second_disp based on sum value
		case sum is
			when "01010" => second_disp <= "0000";
			when "01011" => second_disp <= "0001";
			when "01100" => second_disp <= "0010";
			when "01101" => second_disp <= "0011";
			when "01110" => second_disp <= "0100";
			when "01111" => second_disp <= "0101";
			when "10000" => second_disp <= "0110";
			when "10001" => second_disp <= "0111";
			when "10010" => second_disp <= "1000";
			when "10011" => second_disp <= "1001";
			when others => second_disp <= "1111"; -- Undefined for other inputs
		end case;
	 end process;
		 
	 -- Comparator logic to check if sum is greater than 9
    is_sum_greater_than_9 <= '1' WHEN sum(4 DOWNTO 0) > "01001" ELSE '0';

    -- Logic for HEX1 (MSD)
    HEX1 <= to_7segment("0001") WHEN is_sum_greater_than_9 = '1' ELSE to_7segment("0000");

    -- Logic for HEX0 (LSD)
    HEX0 <= to_7segment(second_disp(3 DOWNTO 0)) WHEN is_sum_greater_than_9 = '1' ELSE to_7segment(sum(3 DOWNTO 0));
	 
END Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Full Adder Entity
ENTITY FullAdder is
    PORT ( a   : in  STD_LOGIC;
           b   : in  STD_LOGIC;
           ci  : in  STD_LOGIC;
           s   : out STD_LOGIC;
           co  : out STD_LOGIC);
END FullAdder;

ARCHITECTURE Behavioral of FullAdder is
BEGIN
    -- Sum output is XOR of a, b, and ci
    s <= (a xor b) xor ci;

    -- Carry out logic 
    co <= b WHEN (a xor b)='0' ELSE ci;
END Behavioral;
