----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:17 05/02/2013 
-- Design Name: 
-- Module Name:    and_gate - dataflow 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- entity declaration
entity and_gate is
	port(a : in bit;
		b: in bit;
			y: out bit);
	end and_gate;

-- architecture

	architecture dataflow of and_gate is 
	begin
		Y<= a and b;
		

end dataflow;

