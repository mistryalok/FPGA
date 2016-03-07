--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : wa.vhw
-- /___/   /\     Timestamp : Wed May 22 21:42:18 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wa
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wa IS
END wa;

ARCHITECTURE testbench_arch OF wa IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT JK
        PORT (
            JK : In std_logic_vector (1 DownTo 0);
            Q : InOut std_logic;
            Qn : InOut std_logic;
            clk : In std_logic
        );
    END COMPONENT;

    SIGNAL JK : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL Q : std_logic := 'Z';
    SIGNAL Qn : std_logic := 'Z';
    SIGNAL clk : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : JK
        PORT MAP (
            JK => JK,
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
                JK <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                JK <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                JK <= "00";
                -- -------------------------------------
                WAIT FOR 615 ns;

            END PROCESS;

    END testbench_arch;

