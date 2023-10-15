library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity EightBitAdder is
    Port (
        KEY0 : in STD_LOGIC; -- Active-low reset
        KEY1 : in STD_LOGIC; -- Clock input
        SW   : in STD_LOGIC_VECTOR(7 downto 0); -- Input switches
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX5 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX4 : out STD_LOGIC_VECTOR(6 downto 0);
        LEDR : out STD_LOGIC_VECTOR(7 downto 0)
    );
end EightBitAdder;

architecture Behavioral of EightBitAdder is
    signal A, B, S : STD_LOGIC_VECTOR(7 downto 0);
    signal carryout : STD_LOGIC;
begin
    process(KEY0, KEY1)
    begin
        if KEY0 = '0' then
            -- Reset
            A <= (others => '0');
            B <= (others => '0');
            carryout <= '0';
        elsif rising_edge(KEY1) then
            -- Clock input
            A <= SW;
            B <= A; -- Store A in B
            S <= (others => '0'); -- Clear S
            for i in 0 to 7 loop
                S(i) <= A(i) XOR B(i) XOR carryout;
                carryout <= (A(i) AND B(i)) OR (carryout AND (A(i) OR B(i)));
            end loop;
        end if;
    end process;

    -- Convert A, B, and S to 7-segment display outputs (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5)
    HEX0 <= "1111111"; 
    HEX1 <= "1111111"; 
    HEX2 <= "1111111"; 
    HEX3 <= "1111111"; //This section will need to be changed
    HEX4 <= "1111111"; 
    HEX5 <= "1111111";

    --carryout signal to LEDR(0)
    LEDR <= "00000001" when carryout = '1' else "00000000";
end Behavioral;
