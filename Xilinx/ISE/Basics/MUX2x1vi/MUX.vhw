--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : MUX.vhw
-- /___/   /\     Timestamp : Wed May 22 17:13:06 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: MUX
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY MUX IS
END MUX;

ARCHITECTURE testbench_arch OF MUX IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT MUX2x1vi
        PORT (
            I : In std_logic_vector (1 DownTo 0);
            S : In std_logic;
            O : Out std_logic
        );
    END COMPONENT;

    SIGNAL I : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL S : std_logic := '0';
    SIGNAL O : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : MUX2x1vi
        PORT MAP (
            I => I,
            S => S,
            O => O
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
                I <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                I <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                I <= "00";
                -- -------------------------------------
                WAIT FOR 615 ns;

            END PROCESS;

    END testbench_arch;

