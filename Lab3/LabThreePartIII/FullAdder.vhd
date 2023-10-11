--Lab Three Part III

--Students:
--	Hansen Shamoon 
--	Deepak Neupane

-- 
--

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

    -- Carry out logic 
    co <= b WHEN (a xor b)='0' ELSE ci;
END Behavioral;
