----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:13 05/22/2013 
-- Design Name: 
-- Module Name:    Encoder4x2 - Behavioral 
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

entity Encoder4x2 is
    Port ( I : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (1 downto 0));
end Encoder4x2;

architecture Behavioral of Encoder4x2 is

begin

	process(I)
	begin
		case i is
			when "0001" => O <= "00";
			when "0010" => O <= "01";
			when "0100" => O <= "10";
			when "1000" => O <= "11";
			when others => null;
			
		end case;
	end process;

		


end Behavioral;

