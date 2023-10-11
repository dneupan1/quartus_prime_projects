--Lab One - Part V

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- This circuit implements a simple RS Latch circuit and confirm the
-- simulation waveform.
--


LIBRARY ieee;
USE ieee.std_logic_1164.all;



-- Four Bit Adder (Top Level Entity) 
ENTITY LabThreePartI is
    PORT ( 
				Clk, R, S: IN STD_LOGIC;
				Q : OUT STD_LOGIC);
END LabThreePartI;

ARCHITECTURE Structural of LabThreePartI is
	SIGNAL R_g, S_g, Qa, Qb: STD_LOGIC;
	ATTRIBUTE KEEP: BOOLEAN;
	ATTRIBUTE KEEP OF R_g, S_g, Qa, Qb: SIGNAL IS TRUE;
BEGIN 
	R_g <= R and Clk;
	S_g <= S and Clk;
	Qa <= NOT (R_g OR Qb);
	Qb <= NOT (S_g OR Qa);
	Q <= Qa;
END Structural;
