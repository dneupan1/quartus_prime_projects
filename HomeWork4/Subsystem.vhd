-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\FourBitRippleAdder\Subsystem.vhd
-- Created: 2023-10-18 19:33:50
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem
-- Source Path: FourBitRippleAdder/Subsystem
-- Hierarchy Level: 1
-- Model version: 1.7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem IS
  PORT( ci                                :   IN    std_logic;
        a                                 :   IN    std_logic;
        b                                 :   IN    std_logic;
        co                                :   OUT   std_logic;
        sum                               :   OUT   std_logic
        );
END Subsystem;


ARCHITECTURE rtl OF Subsystem IS

  -- Signals
  SIGNAL AND_out1                         : std_logic;
  SIGNAL OR1_out1                         : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL XOR_out1                         : std_logic;

BEGIN
  AND_out1 <= a AND b;

  OR1_out1 <= a OR b;

  AND1_out1 <= OR1_out1 AND ci;

  co <= AND_out1 OR AND1_out1;

  XOR_out1 <= a XOR b;

  sum <= ci XOR XOR_out1;

END rtl;

