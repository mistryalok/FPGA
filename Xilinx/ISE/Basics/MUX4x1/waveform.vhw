--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : waveform.vhw
-- /___/   /\     Timestamp : Thu Apr 04 16:33:21 2013
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: waveform
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY waveform IS
END waveform;

ARCHITECTURE testbench_arch OF waveform IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT MUX4x1
        PORT (
            A : In BIT_VECTOR (3 DownTo 0);
            S : In BIT_VECTOR (1 DownTo 0);
            D : Out STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A : BIT_VECTOR (3 DownTo 0) := "0000";
    SIGNAL S : BIT_VECTOR (1 DownTo 0) := "00";
    SIGNAL D : STD_LOGIC := '0';

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
                A <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                A <= "0011";
                S <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                S <= "11";
                -- -------------------------------------
                WAIT FOR 600 ns;

            END PROCESS;

    END testbench_arch;

