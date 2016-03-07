--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : T_flipflop_wave.vhw
-- /___/   /\     Timestamp : Thu May 02 19:21:08 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: T_flipflop_wave
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY T_flipflop_wave IS
END T_flipflop_wave;

ARCHITECTURE testbench_arch OF T_flipflop_wave IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT T_flipflop
        PORT (
            clk : In std_logic;
            T : In std_logic;
            Q : InOut std_logic;
            Qn : InOut std_logic
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL T : std_logic := '0';
    SIGNAL Q : std_logic := 'Z';
    SIGNAL Qn : std_logic := 'Z';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : T_flipflop
        PORT MAP (
            clk => clk,
            T => T,
            Q => Q,
            Qn => Qn
        );

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                T <= '1';
                -- -------------------------------------
                WAIT FOR 1015 ns;

            END PROCESS;

    END testbench_arch;

