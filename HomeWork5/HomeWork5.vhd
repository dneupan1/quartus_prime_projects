-- HomeWork5.vhd
--
-- Student : Deepak Neupane
---
-- This circuit implements a 2 bit greater-than-circuit
-- that checks for X greater than Y. There are three possible
-- output for this circuit:
-- 1. X > Y is true (1)
-- 2. X > Y is false (0)
-- 3. X = Y is true (1)


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Comparator IS
    PORT ( X1, X0 : IN  STD_LOGIC;
           Y1, Y0 : IN  STD_LOGIC;
           X_greater_than_Y : OUT STD_LOGIC;
           X_equal_Y : OUT STD_LOGIC);
END Comparator;

ARCHITECTURE Behavioral OF Comparator IS
BEGIN
PROCESS (X1, X0, Y1, Y0)
BEGIN
    -- Check if X > Y
    if (X1 = '1' and Y1 = '0') then
        X_greater_than_Y <= '1';
    elsif (X1 = Y1) and (X0 = '1' and Y0 = '0') then
        X_greater_than_Y <= '1';
    else
        X_greater_than_Y <= '0';
    end if;
    
    -- Check if X = Y
    if (X1 = Y1) and (X0 = Y0) then
        X_equal_Y <= '1';
    else
        X_equal_Y <= '0';
    end if;

END PROCESS;

END Behavioral;
