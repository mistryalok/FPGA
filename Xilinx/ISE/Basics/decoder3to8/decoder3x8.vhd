----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:51 04/04/2013 
-- Design Name: 
-- Module Name:    decoder3x8 - Behavioral 
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

entity decoder3x8 is
    Port ( i : in  bit_VECTOR (2 downto 0);
           o : out  bit_VECTOR (7 downto 0));
end decoder3x8;

architecture Behavioral of decoder3x8 is

begin
	process(i)
		begin
			case i is
				when "000" => o <= "00000001";
				when "001" => o <= "00000010";
				when "010" => o <= "00000100";
				when "011" => o <= "00001000";
				when "100" => o <= "00010000";
				when "101" => o <= "00100000";
				when "110" => o <= "01000000";
				when "111" => o <= "10000000";
				
			end case;
		end process;

end Behavioral;

