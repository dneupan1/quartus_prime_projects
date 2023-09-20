LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


-- Simple entity that connects the SW switches to the LEDR lights 
-- Part 1 code --
ENTITY LabOnePart2 IS
    PORT (
        SW   : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
END ENTITY LabOnePart2;


ARCHITECTURE Behavior OF LabOnePart2 IS 
BEGIN
    LEDR <= SW;
END ARCHITECTURE Behavior;
