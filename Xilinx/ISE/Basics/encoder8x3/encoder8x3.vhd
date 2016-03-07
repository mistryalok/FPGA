----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:54:47 04/04/2013 
-- Design Name: 
-- Module Name:    encoder8x3 - Behavioral 
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

entity encoder8x3 is
    Port ( i : in  std_logic_VECTOR (7 downto 0);
           o : out  std_logic_VECTOR (2 downto 0));
end encoder8x3;

architecture Behavioral of encoder8x3 is

begin
	process(i)
		begin
			case i is
				when "00000001" => o <= "000";
				when "00000010" => o <= "001";
				when "00000100" => o <= "010";
				when "00001000" => o <= "011";
				when "00010000" => o <= "100";
				when "00100000" => o <= "101";
				when "01000000" => o <= "110";
				when "10000000" => o <= "111";
			end case;
	end process;
	
				


end Behavioral;

