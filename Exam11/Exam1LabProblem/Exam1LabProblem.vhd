-- Exam1 Lab Problem
-- Exam1LabProblem.vhd

-- Student: Deepak Neupane
	
-- This is the vhdl implementation of the lab2 question below:
-- Implement the problem 5 (realizing function f(w1, w2, w3) = Minterms (1 ,3, 4, 5, 7)
-- with test inputs

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Exam1LabProblem IS
    PORT(
        w : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- 3-bit input
        f : OUT STD_LOGIC                    -- Output of the function
    );
END ENTITY Exam1LabProblem;

ARCHITECTURE Behavior OF Exam1LabProblem IS
    SIGNAL DecoderOutputs : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    -- 3-to-8 Decoder
    PROCESS(w)
    BEGIN
        CASE w IS
            WHEN "000" => DecoderOutputs <= "00000001";
            WHEN "001" => DecoderOutputs <= "00000010";
            WHEN "010" => DecoderOutputs <= "00000100";
            WHEN "011" => DecoderOutputs <= "00001000";
            WHEN "100" => DecoderOutputs <= "00010000";
            WHEN "101" => DecoderOutputs <= "00100000";
            WHEN "110" => DecoderOutputs <= "01000000";
            WHEN "111" => DecoderOutputs <= "10000000";
            WHEN OTHERS => DecoderOutputs <= "00000000";
        END CASE;
    END PROCESS;

    -- OR operation for the minterms 1, 3, 4, 5, and 7
    f <= DecoderOutputs(1) OR DecoderOutputs(3) OR DecoderOutputs(4) OR DecoderOutputs(5) OR DecoderOutputs(7);

END ARCHITECTURE Behavior;
