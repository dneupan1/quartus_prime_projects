LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


-- Simple entity that connects the SW switches to the LEDR lights 
-- Part 1 code --
ENTITY LabOnePart2 IS
    PORT (
		  S   : IN STD_LOGIC;
        X   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		  Y   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        M 	: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0)
    );
END ENTITY LabOnePart2;


ARCHITECTURE Behavior OF LabOnePart2 IS 
BEGIN
	
	M <= Y when S = '1' else X;
END ARCHITECTURE Behavior;
