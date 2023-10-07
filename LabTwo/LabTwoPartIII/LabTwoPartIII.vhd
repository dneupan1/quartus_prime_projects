--Lab One - Part VI

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

--
--


LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Four Bit Adder (Top Level Entity) 
ENTITY LabTwoPartIII is
    PORT ( A     : in  STD_LOGIC_VECTOR(3 downto 0);
           B     : in  STD_LOGIC_VECTOR(3 downto 0);
           Cin   : in  STD_LOGIC;
           Sum   : out STD_LOGIC_VECTOR(3 downto 0);
           Cout  : out STD_LOGIC);
END LabTwoPartIII;

ARCHITECTURE Behavioral of LabTwoPartIII is
	  COMPONENT FullAdder
		PORT ( 
				 a   : in  STD_LOGIC;
				 b   : in  STD_LOGIC;
				 ci  : in  STD_LOGIC;
				 s   : out STD_LOGIC;
				 co  : out STD_LOGIC
			 );
		END COMPONENT;
    signal c : STD_LOGIC_VECTOR(4 downto 0);
BEGIN
    c(0) <= Cin;

    FA0: FullAdder port map(a => A(0), b => B(0), ci => c(0), s => Sum(0), co => c(1));	 
    FA1: FullAdder port map(a => A(1), b => B(1), ci => c(1), s => Sum(1), co => c(2));
    FA2: FullAdder port map(a => A(2), b => B(2), ci => c(2), s => Sum(2), co => c(3));
    FA3: FullAdder port map(a => A(3), b => B(3), ci => c(3), s => Sum(3), co => c(4));

    Cout <= c(4);
END Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Full Adder Entity
ENTITY FullAdder is
    PORT ( a   : in  STD_LOGIC;
           b   : in  STD_LOGIC;
           ci  : in  STD_LOGIC;
           s   : out STD_LOGIC;
           co  : out STD_LOGIC);
END FullAdder;

ARCHITECTURE Behavioral of FullAdder is
BEGIN
    -- Sum output is XOR of a, b, and ci
    s <= (a xor b) xor ci;

    -- Carry out logic incomplete
    co <= b WHEN (a xor b)='0' ELSE ci;
END Behavioral;
