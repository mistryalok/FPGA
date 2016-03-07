--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : FA_waveform.vhw
-- /___/   /\     Timestamp : Thu May 02 18:16:47 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FA_waveform
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY FA_waveform IS
END FA_waveform;

ARCHITECTURE testbench_arch OF FA_waveform IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FA_adder
        PORT (
            a1 : In STD_LOGIC;
            b1 : In STD_LOGIC;
            C1 : In STD_LOGIC;
            C2 : Out STD_LOGIC;
            S2 : Out STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a1 : STD_LOGIC := '0';
    SIGNAL b1 : STD_LOGIC := '0';
    SIGNAL C1 : STD_LOGIC := '0';
    SIGNAL C2 : STD_LOGIC := '0';
    SIGNAL S2 : STD_LOGIC := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : FA_adder
        PORT MAP (
            a1 => a1,
            b1 => b1,
            C1 => C1,
            C2 => C2,
            S2 => S2
        );

        PROCESS    -- clock process for a1
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                a1 <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                a1 <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                C1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                b1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                C1 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  785ns
                WAIT FOR 200 ns;
                b1 <= '0';
                C1 <= '1';
                -- -------------------------------------
                WAIT FOR 415 ns;

            END PROCESS;

    END testbench_arch;

