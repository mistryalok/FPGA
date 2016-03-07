--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : MUX2x.vhw
-- /___/   /\     Timestamp : Wed Apr 03 17:19:24 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: MUX2x
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY MUX2x IS
END MUX2x;

ARCHITECTURE testbench_arch OF MUX2x IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT MUX2x1
        PORT (
            S : In std_logic;
            A0 : In std_logic;
            A1 : In std_logic;
            D : Out std_logic
        );
    END COMPONENT;

    SIGNAL S : std_logic := '0';
    SIGNAL A0 : std_logic := '0';
    SIGNAL A1 : std_logic := '0';
    SIGNAL D : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : MUX2x1
        PORT MAP (
            S => S,
            A0 => A0,
            A1 => A1,
            D => D
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
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                A0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                A1 <= '1';
                -- -------------------------------------
                WAIT FOR 815 ns;

            END PROCESS;

    END testbench_arch;

