--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : wave.vhw
-- /___/   /\     Timestamp : Thu Apr 04 19:09:24 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wave
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wave IS
END wave;

ARCHITECTURE testbench_arch OF wave IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT RSFF
        PORT (
            clk : In std_logic;
            reset : In std_logic;
            set : In std_logic;
            R : In std_logic;
            S : In std_logic;
            Q : Out std_logic;
            Qn : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL reset : std_logic := '0';
    SIGNAL set : std_logic := '0';
    SIGNAL R : std_logic := '0';
    SIGNAL S : std_logic := '0';
    SIGNAL Q : std_logic := '0';
    SIGNAL Qn : std_logic := '0';

    constant PERIOD_R : time := 200 ns;
    constant DUTY_CYCLE_R : real := 0.5;
    constant OFFSET_R : time := 200 ns;
    constant PERIOD_clk : time := 200 ns;
    constant DUTY_CYCLE_clk : real := 0.5;
    constant OFFSET_clk : time := 100 ns;

    BEGIN
        UUT : RSFF
        PORT MAP (
            clk => clk,
            reset => reset,
            set => set,
            R => R,
            S => S,
            Q => Q,
            Qn => Qn
        );

        PROCESS    -- clock process for R
        BEGIN
            WAIT for OFFSET_R;
            CLOCK_LOOP : LOOP
                R <= '0';
                WAIT FOR (PERIOD_R - (PERIOD_R * DUTY_CYCLE_R));
                R <= '1';
                WAIT FOR (PERIOD_R * DUTY_CYCLE_R);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET_clk;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD_clk - (PERIOD_clk * DUTY_CYCLE_clk));
                clk <= '1';
                WAIT FOR (PERIOD_clk * DUTY_CYCLE_clk);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS    -- Process for R
            BEGIN
                WAIT FOR 1200 ns;

            END PROCESS;

            PROCESS    -- Process for clk
                BEGIN
                    WAIT FOR 1200 ns;

                END PROCESS;

        END testbench_arch;

