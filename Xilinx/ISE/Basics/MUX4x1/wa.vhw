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
-- /___/   /\     Timestamp : Thu Apr 04 16:59:26 2013
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

    COMPONENT MUX4x1
        PORT (
            w : In std_logic_vector (3 DownTo 0);
            s : In BIT_VECTOR (1 DownTo 0);
            f : Out std_logic
        );
    END COMPONENT;

    SIGNAL w : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL s : BIT_VECTOR (1 DownTo 0) := "00";
    SIGNAL f : std_logic := '0';

    BEGIN
        UUT : MUX4x1
        PORT MAP (
            w => w,
            s => s,
            f => f
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                w <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                w <= "0110";
                s <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                w <= "0111";
                s <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                w <= "0001";
                s <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                w <= "0101";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                w <= "0011";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                w <= "0101";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                s <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  900ns
                WAIT FOR 100 ns;
                w <= "0011";
                -- -------------------------------------
                WAIT FOR 100 ns;

            END PROCESS;

    END testbench_arch;

