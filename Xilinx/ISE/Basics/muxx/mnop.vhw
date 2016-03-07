--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : mnop.vhw
-- /___/   /\     Timestamp : Wed Apr 03 18:03:39 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: mnop
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY mnop IS
END mnop;

ARCHITECTURE testbench_arch OF mnop IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT muxx
        PORT (
            S : In BIT_VECTOR (1 DownTo 0);
            A : In std_logic_vector (3 DownTo 0);
            D : Out std_logic
        );
    END COMPONENT;

    SIGNAL S : BIT_VECTOR (1 DownTo 0) := "00";
    SIGNAL A : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL D : std_logic := '0';

    BEGIN
        UUT : muxx
        PORT MAP (
            S => S,
            A => A,
            D => D
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                S <= "01";
                A <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                A <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                S <= "00";
                A <= "0000";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                S <= "11";
                A <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                S <= "10";
                A <= "0110";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                A <= "1111";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                A <= "1101";
                -- -------------------------------------
                WAIT FOR 300 ns;

            END PROCESS;

    END testbench_arch;

