-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\HomeWork4\HomeWork4.vhd
-- Created: 2023-10-18 19:33:50
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 0.2
-- Target subsystem base rate: 0.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: HomeWork4
-- Source Path: HomeWork4
-- Hierarchy Level: 0
-- Model version: 1.7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY HomeWork4 IS
  PORT( Input                             :   IN    std_logic;
        Input1                            :   IN    std_logic;
        Input2                            :   IN    std_logic;
        Input3                            :   IN    std_logic;
        Input4                            :   IN    std_logic;
        Input5                            :   IN    std_logic;
        Input6                            :   IN    std_logic;
        Input7                            :   IN    std_logic;
        Input8                            :   IN    std_logic;
        Outport1                          :   OUT   std_logic;
        Outport2                          :   OUT   std_logic;
        Outport3                          :   OUT   std_logic;
        Outport4                          :   OUT   std_logic;
        Outport                           :   OUT   std_logic
        );
END HomeWork4;


ARCHITECTURE rtl OF HomeWork4 IS

  -- Component Declarations
  COMPONENT Subsystem
    PORT( ci                              :   IN    std_logic;
          a                               :   IN    std_logic;
          b                               :   IN    std_logic;
          co                              :   OUT   std_logic;
          sum                             :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Subsystem1
    PORT( ci                              :   IN    std_logic;
          a                               :   IN    std_logic;
          b                               :   IN    std_logic;
          co                              :   OUT   std_logic;
          sum                             :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Subsystem2
    PORT( ci                              :   IN    std_logic;
          a                               :   IN    std_logic;
          b                               :   IN    std_logic;
          co                              :   OUT   std_logic;
          sum                             :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Subsystem3
    PORT( ci                              :   IN    std_logic;
          a                               :   IN    std_logic;
          b                               :   IN    std_logic;
          co                              :   OUT   std_logic;
          sum                             :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Subsystem
    USE ENTITY work.Subsystem(rtl);

  FOR ALL : Subsystem1
    USE ENTITY work.Subsystem1(rtl);

  FOR ALL : Subsystem2
    USE ENTITY work.Subsystem2(rtl);

  FOR ALL : Subsystem3
    USE ENTITY work.Subsystem3(rtl);

  -- Signals
  SIGNAL c1                               : std_logic;
  SIGNAL sum0                             : std_logic;
  SIGNAL c2                               : std_logic;
  SIGNAL sum1                             : std_logic;
  SIGNAL c3                               : std_logic;
  SIGNAL sum2                             : std_logic;
  SIGNAL c4                               : std_logic;
  SIGNAL sum3                             : std_logic;

BEGIN
  -- Add your design targeted for ASIC/FPGA inside HDL_DUT and then run the following command:
  -- makehdl('HDL_DUT')

  u_Subsystem : Subsystem
    PORT MAP( ci => Input2,
              a => Input,
              b => Input1,
              co => c1,
              sum => sum0
              );

  u_Subsystem1 : Subsystem1
    PORT MAP( ci => c1,
              a => Input3,
              b => Input4,
              co => c2,
              sum => sum1
              );

  u_Subsystem2 : Subsystem2
    PORT MAP( ci => c2,
              a => Input5,
              b => Input6,
              co => c3,
              sum => sum2
              );

  u_Subsystem3 : Subsystem3
    PORT MAP( ci => c3,
              a => Input7,
              b => Input8,
              co => c4,
              sum => sum3
              );

  Outport1 <= sum0;

  Outport2 <= sum1;

  Outport3 <= sum2;

  Outport4 <= sum3;

  Outport <= c4;

END rtl;

