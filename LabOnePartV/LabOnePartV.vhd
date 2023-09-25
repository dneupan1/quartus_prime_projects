LIBRARY ieee;
USE ieee.std_logic_1164.all;
 

-- Library code here
ENTITY mux_2bit_4to1 IS
    PORT (
        S, U, V, W, X   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        M : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END ENTITY mux_2bit_4to1;

ARCHITECTURE Behavior OF mux_2bit_4to1 IS 
BEGIN
    PROCESS (S, U, V, W, X)
    BEGIN
        CASE S IS
            WHEN "00" => M <= U;
            WHEN "01" => M <= V;
            WHEN "10" => M <= W;
            WHEN "11" => M <= X;
            WHEN OTHERS => M <= "00"; -- Default case
        END CASE;
    END PROCESS;
END ARCHITECTURE Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
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
 

ENTITY LabOnePartV IS
    PORT ( 
        SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
        HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END LabOnePartV;


-- main Architecture for Part 5
ARCHITECTURE Behavior OF LabOnePartV IS
    COMPONENT mux_2bit_4to1
        PORT ( 
            S, U, V, W, X : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
            M : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT char_7seg
        PORT ( 
            C : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Display : OUT STD_LOGIC_VECTOR(0 TO 6)
        );
    END COMPONENT;

    SIGNAL M0, M1, M2, M3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL ROTATE_HEX0, ROTATE_HEX1, ROTATE_HEX2, ROTATE_HEX3: STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
	U0: mux_2bit_4to1 PORT MAP (SW(9 DOWNTO 8), SW(7 DOWNTO 6), SW(5 DOWNTO 4), SW(3 DOWNTO 2), SW(1 DOWNTO 0), M0);
	H0: char_7seg PORT MAP (M0, HEX0);
	

	LEDR <= SW;  -- Directly connecting the switches to the red LEDs

END Behavior;

