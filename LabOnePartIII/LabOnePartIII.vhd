LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


-- Simple entity that connects the SW switches to the LEDR lights 
-- Part 1 code --
ENTITY LabOnePartIII IS
    PORT (
		  S0, S1   : IN STD_LOGIC;
        U, V, W, X   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		  M : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END ENTITY LabOnePartIII;


ARCHITECTURE Behavior OF LabOnePartIII IS 
BEGIN
	M <= U WHEN S0 = '0' AND S1 = '0'
	  ELSE V WHEN S0 = '1' AND S1 = '0'
	  ELSE W WHEN S0 = '0' AND S1 = '1'
	  ELSE X WHEN S0 = '1' AND S1 = '1';
END ARCHITECTURE Behavior;
