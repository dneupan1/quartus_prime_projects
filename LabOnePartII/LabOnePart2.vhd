
--Lab One - Part II

--Students:
--	Hansen Shamoon 
--	Deepak Neupane
	
-- this program implements a sum-of-products circuit that implements a 2-to-1 multiplexer
-- with a select input s. If s =0 the multiplexer’s output m is equal to the input x, and
-- if s = 1 the output is equal to y

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Part 1 code --
ENTITY LabOnePart2 IS
    PORT (
		  S   : IN STD_LOGIC;
        X   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		  Y   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        M 	: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
		  LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
END ENTITY LabOnePart2;


ARCHITECTURE Behavior OF LabOnePart2 IS 
BEGIN
	
	M <= Y when S = '1' else X;
	LEDR(9) <= S;
END ARCHITECTURE Behavior;
