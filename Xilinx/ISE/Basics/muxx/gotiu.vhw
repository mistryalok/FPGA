--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : gotiu.vhw
-- /___/   /\     Timestamp : Wed Apr 03 17:59:53 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: gotiu
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY gotiu IS
END gotiu;

ARCHITECTURE testbench_arch OF gotiu IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT muxx
        PORT (
            S : In BIT_VECTOR (1 DownTo 0);
            A0 : In std_logic;
            A1 : In std_logic;
            A2 : In std_logic;
            A3 : In std_logic;
            D : Out std_logic
        );
    END COMPONENT;

    SIGNAL S : BIT_VECTOR (1 DownTo 0) := "00";
    SIGNAL A0 : std_logic := '0';
    SIGNAL A1 : std_logic := '0';
    SIGNAL A2 : std_logic := '0';
    SIGNAL A3 : std_logic := '0';
    SIGNAL D : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : muxx
        PORT MAP (
            S => S,
            A0 => A0,
            A1 => A1,
            A2 => A2,
            A3 => A3,
            D => D
        );

        PROCESS    -- clock process for A0
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                A0 <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                A0 <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                A1 <= '1';
                A3 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                A2 <= '1';
                A3 <= '0';
                -- -------------------------------------
                WAIT FOR 815 ns;

            END PROCESS;

    END testbench_arch;

