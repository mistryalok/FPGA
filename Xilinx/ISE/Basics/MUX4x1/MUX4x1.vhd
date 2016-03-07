----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:43 04/04/2013 
-- Design Name: 
-- Module Name:    MUX4x1 - Behavioral 
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

entity MUX4x1 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  bit_VECTOR (1 downto 0);
           c : out  STD_LOGIC);
end MUX4x1;

architecture Behavioral of MUX4x1 is

begin
	process(b)
		begin
			case b is
				when "00" => c <= a(0);
				when "01" => c <= a(1);
				when "10" => c <= a(2);
				when "11" => c <= a(3);
				
			end case;
	end process;
	
				


end Behavioral;

