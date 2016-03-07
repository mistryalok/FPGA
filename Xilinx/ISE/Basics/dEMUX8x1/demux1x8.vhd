----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:23 04/04/2013 
-- Design Name: 
-- Module Name:    demux1x8 - Behavioral 
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

entity demux1x8 is
    Port ( i : in  STD_LOGIC;
           o : out  std_logic_VECTOR (7 downto 0);
           s : in  bit_VECTOR (2 downto 0));
end demux1x8;

architecture Behavioral of demux1x8 is

begin
	process(S)
		begin
			case s is
				when "000" => o(0) <= i;
				when "001" => o(1) <= i;
				when "010" => o(2) <= i;
				when "011" => o(3) <= i;
				when "100" => o(4) <= i;
				when "101" => o(5) <= i;
				when "110" => o(6) <= i;
				when "111" => o(7) <= i;
				
			end case;
	end process;

end Behavioral;

