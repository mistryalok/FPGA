----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:04:18 05/22/2013 
-- Design Name: 
-- Module Name:    RS_viva - Behavioral 
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

entity RS_viva is
    Port ( R : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end RS_viva;

architecture Behavioral of RS_viva is

begin

	process(clk)
	begin
	
		if(clk='1' and clk'event)then
			if(R='1')then
				Q<= '0';
				Qn <= '1';
			elsif (s='1') then
				q <= '1';
				qn <= '0';
			end if;
		end if;
	end process;
			
				
		

end Behavioral;

