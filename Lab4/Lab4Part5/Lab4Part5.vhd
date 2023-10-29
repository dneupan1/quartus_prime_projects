--Lab Four - part 5

--Students:
--	Hansen Shamoon 
--	Deepak Neupane
	
-- Implemening 6-to-1 multiplexers using 3 bit wide inputs. The outputs are 
-- rotated in the 6 HEX displays in DE1-SoC board based a counter
-- incremented every second.


LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY Lab4Part5 IS
    PORT ( 
        CLK: IN STD_LOGIC;
        HEX5 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX4 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END Lab4Part5;


-- main Architecture for Part 5
ARCHITECTURE Behavior OF Lab4Part5 IS
    SIGNAL timer: integer := 0;
	 SIGNAL current_display: integer := 0;
BEGIN
    PROCESS (CLK)
	 
    BEGIN
		  IF rising_edge(CLK) THEN
				timer <= timer + 1;
				
				IF timer = 49999999 THEN -- for a 50 MHz clock frequency
					timer <= 0;
					current_display <= current_display + 1;
					IF current_display > 7 THEN
						current_display <= 0;
					END IF;
				END IF;
		  END IF;
        CASE current_display IS
            WHEN 0 =>
                HEX5 <= "1111111";
                HEX4 <= "1111111";
                HEX3 <= "1000010";
                HEX2 <= "0110000";
                HEX1 <= "1001111";
                HEX0 <= "0000001";

            WHEN 1 => 
                HEX5 <= "1111111";
                HEX4 <= "1000010";
                HEX3 <= "0110000";
                HEX2 <= "1001111";
                HEX1 <= "0000001";
					 HEX0 <= "1111111";

            WHEN 2 => 
                HEX5 <= "1000010";
                HEX4 <= "0110000";
                HEX3 <= "1001111";
                HEX2 <= "0000001";
					 HEX1 <= "1111111";
					 HEX0 <= "1111111";
					 
				WHEN 3 => 
                HEX5 <= "0110000";
                HEX4 <= "1001111";
                HEX3 <= "0000001";
					 HEX2 <= "1111111";
					 HEX1 <= "1111111";
					 HEX0 <= "1000010";
					 
				WHEN 4 => 
                HEX5 <= "1001111";
                HEX4 <= "0000001";
					 HEX3 <= "1111111";
					 HEX2 <= "1111111";
					 HEX1 <= "1000010";
					 HEX0 <= "0110000";

            WHEN 5 => 
                HEX5 <= "0000001";
					 HEX4 <= "1111111";
					 HEX3 <= "1111111";
					 HEX2 <= "1000010";
					 HEX1 <= "0110000";
					 HEX0 <= "1001111";

            WHEN 6 => 
					 HEX5 <= "1111111";
					 HEX4 <= "1111111";
					 HEX3 <= "1000010";
					 HEX2 <= "0110000";
					 HEX1 <= "1001111";
					 HEX0 <= "0000001";

				WHEN 7 => 
					 HEX5 <= "1111111";
					 HEX4 <= "1000010";
					 HEX3 <= "0110000";
					 HEX2 <= "1001111";
					 HEX1 <= "0000001";
					 HEX0 <= "1111111";
			   WHEN Others =>
					 HEX5 <= "1111111";
					 HEX4 <= "1111111";
					 HEX3 <= "1111111";
					 HEX2 <= "1111111";
					 HEX1 <= "1111111";
					 HEX0 <= "1111111";
        END CASE;
    END PROCESS;
END Behavior;

