--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : Rswave.vhw
-- /___/   /\     Timestamp : Wed May 22 18:22:05 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: Rswave
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY Rswave IS
END Rswave;

ARCHITECTURE testbench_arch OF Rswave IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT RS_viva
        PORT (
            R : In std_logic;
            S : In std_logic;
            Q : Out std_logic;
            Qn : Out std_logic;
            clk : In std_logic
        );
    END COMPONENT;

    SIGNAL R : std_logic := '0';
    SIGNAL S : std_logic := '0';
    SIGNAL Q : std_logic := '0';
    SIGNAL Qn : std_logic := '0';
    SIGNAL clk : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : RS_viva
        PORT MAP (
            R => R,
            S => S,
            Q => Q,
            Qn => Qn,
            clk => clk
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
                R <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                R <= '0';
                S <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                R <= '1';
                S <= '0';
                -- -------------------------------------
                WAIT FOR 615 ns;

            END PROCESS;

    END testbench_arch;

