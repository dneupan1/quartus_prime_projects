--Lab One - Part II

--Students:
--	Hansen Shamoon 
--	Deepak Neupane
	
-- In this lab, we create a 2 bit wide 4-to-1 multiplexer, the 2 select inputs
-- are connected Switches 9-8 and switches 7-0 for four 2 bit inputs to the 
-- multiplexer

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

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
