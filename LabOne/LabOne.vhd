LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Simple entity that connects the SW switches to the LEDR lights 
ENTITY LabOne IS
    PORT (
        SW   : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
END ENTITY LabOne;

ARCHITECTURE Behavior OF LabOne IS 
BEGIN
    LEDR <= SW;
END ARCHITECTURE Behavior;
