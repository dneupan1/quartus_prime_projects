LIBRARY ieee;
USE ieee.std_logic_1164.all;
 


ENTITY LabOnePartVI IS
    PORT ( 
        SW : IN STD_LOGIC_VECTOR(9 DOWNTO 7);
        LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 7);
        HEX5 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX4 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END LabOnePartVI;


-- main Architecture for Part 5
ARCHITECTURE Behavior OF LabOnePartVI IS
    

BEGIN
    PROCESS (SW)
    BEGIN
        CASE SW(9 DOWNTO 7) IS
            WHEN "000" =>
                HEX5 <= "1111111";
                HEX4 <= "1111111";
                HEX3 <= "1000010";
                HEX2 <= "0110000";
                HEX1 <= "1001111";
                HEX0 <= "0000001";

            WHEN "001" => 
                HEX5 <= "1111111";
                HEX4 <= "1000010";
                HEX3 <= "0110000";
                HEX2 <= "1001111";
                HEX1 <= "0000001";
					 HEX0 <= "1111111";

            WHEN "010" => 
                HEX5 <= "1000010";
                HEX4 <= "0110000";
                HEX3 <= "1001111";
                HEX2 <= "0000001";
					 HEX1 <= "1111111";
					 HEX0 <= "1111111";
					 
				WHEN "011" => 
                HEX5 <= "0110000";
                HEX4 <= "1001111";
                HEX3 <= "0000001";
					 HEX2 <= "1111111";
					 HEX1 <= "1111111";
					 HEX0 <= "1000010";
					 
				WHEN "100" => 
                HEX5 <= "1001111";
                HEX4 <= "0000001";
					 HEX3 <= "1111111";
					 HEX2 <= "1111111";
					 HEX1 <= "1000010";
					 HEX0 <= "0110000";

            WHEN "101" => 
                HEX5 <= "0000001";
					 HEX4 <= "1111111";
					 HEX3 <= "1111111";
					 HEX2 <= "1000010";
					 HEX1 <= "0110000";
					 HEX0 <= "1001111";

            WHEN "110" => 
					 HEX5 <= "1111111";
					 HEX4 <= "1111111";
					 HEX3 <= "1000010";
					 HEX2 <= "0110000";
					 HEX1 <= "1001111";
					 HEX0 <= "0000001";

				WHEN "111" => 
					 HEX5 <= "1111111";
					 HEX4 <= "1000010";
					 HEX3 <= "0110000";
					 HEX2 <= "1001111";
					 HEX1 <= "0000001";
					 HEX0 <= "1111111";

        END CASE;
    END PROCESS;

    LEDR <= SW;  -- Directly connecting the switches to the red LEDs

END Behavior;

