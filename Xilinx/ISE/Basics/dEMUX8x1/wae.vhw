--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : wae.vhw
-- /___/   /\     Timestamp : Thu Apr 04 17:33:42 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wae
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wae IS
END wae;

ARCHITECTURE testbench_arch OF wae IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT demux1x8
        PORT (
            i : In std_logic;
            o : Out std_logic_vector (7 DownTo 0);
            s : In BIT_VECTOR (2 DownTo 0)
        );
    END COMPONENT;

    SIGNAL i : std_logic := '0';
    SIGNAL o : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL s : BIT_VECTOR (2 DownTo 0) := "000";

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : demux1x8
        PORT MAP (
            i => i,
            o => o,
            s => s
        );

        PROCESS    -- clock process for i
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                i <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                i <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                s <= "010";
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                s <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  785ns
                WAIT FOR 400 ns;
                s <= "110";
                -- -------------------------------------
                WAIT FOR 415 ns;

            END PROCESS;

    END testbench_arch;

