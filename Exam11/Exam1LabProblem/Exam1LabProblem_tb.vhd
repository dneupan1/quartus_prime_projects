LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Exam1LabProblem_tb IS
END Exam1LabProblem_tb;

ARCHITECTURE behavior OF Exam1LabProblem_tb IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DecoderFunction
    PORT(
         w : IN  std_logic_vector(2 DOWNTO 0);
         f : OUT std_logic
        );
    END COMPONENT;

   --Inputs
   SIGNAL w : std_logic_vector(2 DOWNTO 0) := "000";

    --Outputs
   SIGNAL f : std_logic;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: DecoderFunction PORT MAP (
          w => w,
          f => f
        );

   -- Stimulus process
   stim_proc: process
   begin
        -- Test all possible combinations
        FOR i IN 0 TO 7 LOOP
            w <= CONV_STD_LOGIC_VECTOR(i, 3);
        END LOOP;
   end process;

END;
