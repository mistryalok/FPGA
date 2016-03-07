--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : sr.vhw
-- /___/   /\     Timestamp : Thu May 02 18:44:07 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: sr
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY sr IS
END sr;

ARCHITECTURE testbench_arch OF sr IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT SR_flipflop
        PORT (
            S : In std_logic;
            R : In std_logic;
            Q : Out std_logic;
            Qn : Out std_logic
        );
    END COMPONENT;

    SIGNAL S : std_logic := '0';
    SIGNAL R : std_logic := '0';
    SIGNAL Q : std_logic := '0';
    SIGNAL Qn : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : SR_flipflop
        PORT MAP (
            S => S,
            R => R,
            Q => Q,
            Qn => Qn
        );

        PROCESS    -- clock process for S
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                S <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                S <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                WAIT FOR 1200 ns;

            END PROCESS;

    END testbench_arch;

