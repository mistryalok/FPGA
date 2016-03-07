----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:04:36 04/04/2013 
-- Design Name: 
-- Module Name:    RSFF - Behavioral 
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

entity RSFF is
    Port ( clk : in  std_logic;
           reset : in  std_logic;
           set : in  std_logic;
           R : in  std_logic;
           S : in  std_logic;
           Q : out  std_logic;
           Qn : out  std_logic);
end RSFF;

architecture Behavioral of RSFF is

begin
	process(clk)
		begin
			if(set='1')then
				Q <= '1';
				Qn <= '0';
			elsif (Reset='1') then
				Q <= '0';
				Qn <= '1';
			elsif(clk='1' and clk'event)then
					if(S='1') then
						Q <= S;
						Qn <= not S;
					elsif(R='0') then
						Q <= R;
						Qn <= not R;
				
			
			end if;
		end if;
	end process;
	


end Behavioral;

