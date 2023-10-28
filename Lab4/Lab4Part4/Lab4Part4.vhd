--Lab Four - Part 4

--Students:
--	Hansen Shamoon 
--	Deepak Neupane
	
-- This program implements a 1 second counter to display
-- and shift characters displayed on the 7 segment display
-- from left to right.


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
 
ENTITY char_7seg IS
    PORT (
		  C   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		  Display : OUT STD_LOGIC_VECTOR(0 to 6)
    );
END ENTITY char_7seg;

ARCHITECTURE Behavior OF char_7seg IS 
BEGIN
	Display <= "1000010" WHEN C = "00"
	  ELSE "0110000"  WHEN C = "01"
	  ELSE "1001111" WHEN C = "10"
	  ELSE "0000001" WHEN C = "11";
END ARCHITECTURE Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
 

ENTITY Lab4Part4 IS
    PORT (
		  CLK: IN STD_LOGIC;
        HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END Lab4Part4;


-- main Architecture for Part 5
ARCHITECTURE Behavior OF Lab4Part4 IS
    COMPONENT char_7seg
        PORT ( 
            C : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Display : OUT STD_LOGIC_VECTOR(0 TO 6)
        );
    END COMPONENT;

    SIGNAL M0: STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";
	 SIGNAL M1: STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";
	 SIGNAL M2: STD_LOGIC_VECTOR(1 DOWNTO 0) := "01";
	 SIGNAL M3: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
	 
    SIGNAL timer : integer := 0;
BEGIN
	PROCESS(CLK)
		VARIABLE temp_var : STD_LOGIC_VECTOR(1 DOWNTO 0);
		VARIABLE var_M0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
		VARIABLE var_M1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
		VARIABLE var_M2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
		VARIABLE var_M3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
		BEGIN
		  IF rising_edge(CLK) THEN
				timer <= timer + 1;
				
				IF timer = 49999999 THEN  -- for 50 MHz clock frequency
					timer <= 0;
					-- Load current signal values into variables
					var_M0 := M0;
					var_M1 := M1;
					var_M2 := M2;
					var_M3 := M3;

					-- Use the variables for the rotation
					temp_var := var_M3;  -- Store the rightmost value
					var_M3 := var_M2;    -- Move M2 to M3
					var_M2 := var_M1;    -- Move M1 to M2
					var_M1 := var_M0;    -- Move M0 to M1
					var_M0 := temp_var;  -- Place the stored rightmost value into M0

					-- Update the signals with new values from the variables
					M0 <= var_M0;
					M1 <= var_M1;
					M2 <= var_M2;
					M3 <= var_M3;
					END IF;
		  END IF;
		 END PROCESS;

	-- For HEX0
	H0: char_7seg PORT MAP (M0, HEX0);

	-- For HEX1
	H1: char_7seg PORT MAP (M1, HEX1);

	-- For HEX2
	H2: char_7seg PORT MAP (M2, HEX2);

	-- For HEX3
	H3: char_7seg PORT MAP (M3, HEX3);

END Behavior;

