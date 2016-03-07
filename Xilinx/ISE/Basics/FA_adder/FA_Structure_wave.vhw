--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : FA_Structure_wave.vhw
-- /___/   /\     Timestamp : Thu May 02 18:25:32 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FA_Structure_wave
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY FA_Structure_wave IS
END FA_Structure_wave;

ARCHITECTURE testbench_arch OF FA_Structure_wave IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FA_adder
        PORT (
            a1 : In std_logic;
            b1 : In std_logic;
            C1 : In std_logic;
            C2 : Out std_logic;
            S2 : Out std_logic
        );
    END COMPONENT;

    SIGNAL a1 : std_logic := '0';
    SIGNAL b1 : std_logic := '0';
    SIGNAL C1 : std_logic := '0';
    SIGNAL C2 : std_logic := '0';
    SIGNAL S2 : std_logic := '0';

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
                b1 <= '1';
                C1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                C1 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                b1 <= '0';
                -- -------------------------------------
                WAIT FOR 615 ns;

            END PROCESS;

    END testbench_arch;

