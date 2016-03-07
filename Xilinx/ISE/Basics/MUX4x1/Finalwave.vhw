--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : Finalwave.vhw
-- /___/   /\     Timestamp : Thu Apr 04 16:35:37 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: Finalwave
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY Finalwave IS
END Finalwave;

ARCHITECTURE testbench_arch OF Finalwave IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT MUX4x1
        PORT (
            A : In std_logic_vector (3 DownTo 0);
            S : In BIT_VECTOR (1 DownTo 0);
            D : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL S : BIT_VECTOR (1 DownTo 0) := "00";
    SIGNAL D : std_logic := '0';

    BEGIN
        UUT : MUX4x1
        PORT MAP (
            A => A,
            S => S,
            D => D
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                A <= "0110";
                S <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                A <= "0100";
                S <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                A <= "0110";
                S <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                A <= "0010";
                S <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                A <= "0011";
                -- -------------------------------------
                WAIT FOR 400 ns;

            END PROCESS;

    END testbench_arch;

