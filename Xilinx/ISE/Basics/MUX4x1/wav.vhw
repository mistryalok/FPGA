--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : wav.vhw
-- /___/   /\     Timestamp : Thu Apr 04 17:18:04 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wav
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wav IS
END wav;

ARCHITECTURE testbench_arch OF wav IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT MUX4x1
        PORT (
            a : In std_logic_vector (3 DownTo 0);
            b : In BIT_VECTOR (1 DownTo 0);
            c : Out std_logic
        );
    END COMPONENT;

    SIGNAL a : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL b : BIT_VECTOR (1 DownTo 0) := "00";
    SIGNAL c : std_logic := '0';

    BEGIN
        UUT : MUX4x1
        PORT MAP (
            a => a,
            b => b,
            c => c
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                a <= "0100";
                b <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                a <= "1100";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                a <= "1110";
                b <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 400 ns;
                a <= "1010";
                -- -------------------------------------
                WAIT FOR 200 ns;

            END PROCESS;

    END testbench_arch;

