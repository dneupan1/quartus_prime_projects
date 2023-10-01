-- Deepak Neupane
-- HomeWork3Adder.vhd
--
-- In this code, we have implemented an adder/subtractor circuit.
-- one of the input is the control for either addition or subtraction
-- (add_sub input should be '0' for addition, '1' for subtraction)
-- The code also defines N inside the generic block. That way, the function
-- can be reused by instantiating N to either 8 or 16 bit values as desired.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- For arithmetic operations

entity adder_subtractor is
    generic (
        N : integer := 8 -- Default to 8-bit. Change to 16 if needed.
    );
    port (
        add_sub : in std_logic; -- '0' for addition, '1' for subtraction
        x : in std_logic_vector(N-1 downto 0);
        y : in std_logic_vector(N-1 downto 0);
        result : out std_logic_vector(N-1 downto 0)
    );
end entity adder_subtractor;

architecture behavior of adder_subtractor is
begin
    process(add_sub, x, y)
        variable temp_result : std_logic_vector(N downto 0);
    begin
        if add_sub = '0' then
            temp_result := "0" & x + y; -- Addition
        else
            temp_result := "0" & x - y; -- Subtraction
        end if;
        
        result <= temp_result(N-1 downto 0);
    end process;
end architecture behavior;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- For arithmetic operations

entity adder_subtractor_tb is
end entity adder_subtractor_tb;

architecture sim of adder_subtractor_tb is
    -- Parameters
    constant N : integer := 8;
    
    -- Signals
    signal add_sub : std_logic;
    signal x, y, result : std_logic_vector(N-1 downto 0);
    
    -- Instantiate the unit under test (UUT)
    component adder_subtractor is
        generic (N : integer := 8);
        port(
            add_sub : in std_logic;
            x : in std_logic_vector(N-1 downto 0);
            y : in std_logic_vector(N-1 downto 0);
            result : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
begin
    -- Instantiate UUT
    UUT: adder_subtractor generic map (N => N) port map (
        add_sub => add_sub,
        x => x,
        y => y,
        result => result
    );
    
    -- Testbench process
    tb_proc: process
    begin
        -- Test 1: Addition
        add_sub <= '0';
        x <= "00000011";
        y <= "00000001";
        wait for 10 ns;
        
        -- Test 2: Subtraction
        add_sub <= '1';
        x <= "00000001";
        y <= "00000001";
        wait for 10 ns;
        
        -- Test 3: Another addition
        add_sub <= '0';
        x <= "00000011";
        y <= "00000100";
        wait for 10 ns;
        
        -- Test 4: Another subtraction
        add_sub <= '1';
        x <= "00000011";
        y <= "00000001";
        wait for 10 ns;
        
        -- Stop simulation
        assert false report "End of simulation" severity failure;
    end process tb_proc;

end architecture sim;
