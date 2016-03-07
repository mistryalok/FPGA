----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:21 05/02/2013 
-- Design Name: 
-- Module Name:    OR_gate - Dataflow 
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
use Ieee.std_logic_1164.All;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- entity declaeration 

entity OR_gate is
	port(a: in std_logic;
			b: in std_logic;
			y: out std_logic);
	end or_gate;
	
-- architecture of entity
	architecture dataflow of or_gate is
	begin
		Y<= a or b;
	end dataflow;

