----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:45:35 05/22/2013 
-- Design Name: 
-- Module Name:    JKS - Behavioral 
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

entity JKS is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QN : inout  STD_LOGIC;
           CLK : in  STD_LOGIC);
end JKS;

architecture Behavioral of JKS is

begin
	process(CLK)
	begin
	
		
		if(clk'event and clk='1') then
			 if (j='1' and k='1') then
				Q <= Qn;
				Qn <= not Qn;
			 elsif(j='1') then
				Q <= '1';
				Qn <= '0';
			 elsif (K='1') then
				Q <= '0';
				Qn <= '1';
		end if;
		end if;
	end process;


end Behavioral;

