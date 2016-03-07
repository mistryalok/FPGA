----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:56:53 05/02/2013 
-- Design Name: 
-- Module Name:    FA_adder - Dataflow 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FA_adder is
    Port ( a1 : in  std_logic;
           b1 : in  std_logic;
           C1 : in  std_logic;
           C2 : out std_logic;
           S2 : out std_logic);
end FA_adder;

architecture Dataflow of FA_adder is

	component HA_adder
		port (a : in std_logic;
				b: in std_logic;
				c: out std_logic;
				s: out std_logic);
	end component;

	component OR_gate
		port (a : in std_logic;
				b : in std_logic;
				y : out std_logic);
	end component;
	
		signal Ca,Sa,Cb: std_logic;		
begin

		HAa: HA_adder port map(A1,b1,Ca,Sa);
		HAb: Ha_adder port map(Sa,C1,Cb,S2);
		ORing: OR_gate port map(Ca,Cb,C2);


end Dataflow;

