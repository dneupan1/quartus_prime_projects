--Lab Three Part II

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- In this circuit, we implement a gated D-Latch , a positive-edge triggered D flipflop and
-- a negative edge triggered DFlipFlop in VHDL.
--

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY MyDLatch IS
	PORT (
		D, Clk: IN STD_LOGIC;
		Q : OUT STD_LOGIC);
END MyDLatch ;

ARCHITECTURE Behavior OF MyDLatch IS
BEGIN
	PROCESS (D, Clk)
	BEGIN
		IF Clk='1' THEN
			Q <= D;
		END IF;
	END PROCESS;
END Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY NegativeEdgeDFF IS
	PORT (
		D, Clk	:	IN STD_LOGIC;
		Q	:	OUT STD_LOGIC);
END NegativeEdgeDFF;

ARCHITECTURE Behavior OF NegativeEdgeDFF IS
BEGIN
	PROCESS ( D, Clk )
	BEGIN
		IF (Clk'EVENT and Clk = '0' ) THEN
			Q <= D;
		END IF;
	END PROCESS;
END Behavior;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PositiveEdgeDFF IS
	PORT (
		D, Clk	:	IN STD_LOGIC;
		Q	:	OUT STD_LOGIC);
END PositiveEdgeDFF;

ARCHITECTURE Behavior OF PositiveEdgeDFF IS
BEGIN
	PROCESS (D, Clk)
	BEGIN
		IF (Clk'EVENT and Clk = '1' ) THEN
			Q <= D;
		END IF;
	END PROCESS;
END Behavior;


LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY LabThreePartII is
    PORT ( 
				D, Clk: IN STD_LOGIC;
				Qa, Qb, Qc : OUT STD_LOGIC);
END LabThreePartII;

ARCHITECTURE Behavior of LabThreePartII is
	COMPONENT MyDLatch
		PORT ( D, Clk: IN STD_LOGIC;
				Q: OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT NegativeEdgeDFF
		PORT ( D, Clk: IN STD_LOGIC;
				Q: OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT PositiveEdgeDFF
		PORT ( D, Clk: IN STD_LOGIC;
				Q: OUT STD_LOGIC);
	END COMPONENT;

BEGIN 
	dLatch1: MyDLatch PORT MAP(D, Clk, Qa);
	dLatch2: NegativeEdgeDFF PORT MAP(D, Clk, Qb);
	dLatch3: PositiveEdgeDFF PORT MAP(D, Clk, Qc);
END Behavior;
