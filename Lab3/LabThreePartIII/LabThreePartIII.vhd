--Lab Three Part III

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- 
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.ALL;


ENTITY LabThreePartIII is
    PORT ( SW: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				clock: IN STD_LOGIC;
				reset: IN STD_LOGIC; -- active-low asynchronous reset
				Cout: OUT STD_LOGIC;
				HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END LabThreePartIII;

ARCHITECTURE Behavior of LabThreePartIII is
	COMPONENT BinToHexDisplay 
			PORT (binaryInput	:	IN	STD_LOGIC_VECTOR(3 downto 0);
					hexDisplayOutput	:	OUT STD_LOGIC_VECTOR(6 downto 0));
	END COMPONENT;
	
	SIGNAL A: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL B: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL SUM: STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
	A <= SW;
	B <= SW;
	
	SUM <= ("0" & A) + ("0" & B);
	Cout <= SUM(8);
	
	-- take 8 bit inputs store in A, display in HEX3-2
	DISPL_A0 : BinToHexDisplay PORT MAP(A(3 DOWNTO 0), HEX2);
	DISPL_A1 : BinToHexDisplay PORT MAP(A(7 DOWNTO 4), HEX3);
	
	-- take another 8 bit inputs, store in B, display in HEX 1-0
	DISPL_B0 : BinToHexDisplay PORT MAP(B(3 DOWNTO 0), HEX0);
	DISPL_B1 : BinToHexDisplay PORT MAP(B(7 DOWNTO 4), HEX1);
	
	-- Add the two numbers and store in S, display in HEX 5-4, show Cout in LEDR(0)
	DISPL_SUM0 : BinToHexDisplay PORT MAP(SUM(3 DOWNTO 0), HEX4);
	DISPL_SUM1 : BinToHexDisplay PORT MAP(SUM(7 DOWNTO 4), HEX5);
	
END Behavior;
