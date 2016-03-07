----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:43 05/22/2013 
-- Design Name: 
-- Module Name:    JK - Behavioral 
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

entity JK is
    Port ( JK : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : inout  STD_LOGIC;
           Qn : inout  STD_LOGIC;
           clk : in  STD_LOGIC);
end JK;

architecture Behavioral of JK is

begin
process(clk)
	begin
	
		
		if(clk'event and clk='1') then
			case JK is
			when "00" => null;
			when "10" => Q <= '1' ; qn <= '0';
			when "01" => q <= '0' ; Qn <= '1';
			when "11" => Q <= not q ; Qn <= not Qn;
			when others => null;
			end case;
		end if;
	end process;

end Behavioral;

