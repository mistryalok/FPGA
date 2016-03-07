----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:12:57 05/02/2013 
-- Design Name: 
-- Module Name:    T_flipflop - Behavioral 
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

entity T_flipflop is
    Port ( clk : in  STD_LOGIC;
           T : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           Qn : inout  STD_LOGIC);
end T_flipflop;

architecture Behavioral of T_flipflop is

begin
	
	Q <= '0';
	Qn <= '0';

		
	process(T,clk)
		variable temp : std_logic;
		begin
		temp := Q;
			
				if(clk'event and clk = '1') then
						Q <= not temp;
						Qn <= temp;
				end if;
		end process;


end Behavioral;

