LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


-- Simple entity that connects the SW switches to the LEDR lights 
-- Part 1 code --
ENTITY LabOnePartIV IS
    PORT (
		  C0, C1   : IN STD_LOGIC;
		  HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END ENTITY LabOnePartIV;


ARCHITECTURE Behavior OF LabOnePartIV IS 
BEGIN
	HEX0 <= "0100001" WHEN C1 = '0' AND C0 = '0'
	  ELSE "0000110"WHEN C1 = '1' AND C0 = '0'
	  ELSE "1111001" WHEN C1 = '0' AND C0 = '1'
	  ELSE "1111111" WHEN C0 = '1' AND C1 = '1';
END ARCHITECTURE Behavior;
