----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:52:30 04/03/2013 
-- Design Name: 
-- Module Name:    muxx - Behavioral 
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

entity muxx is
    Port ( S : in  bit_VECTOR (1 downto 0);
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           
           D : out  STD_LOGIC);
end muxx;

architecture Behavioral of muxx is

begin

	process(s)
	--variable d : std_logic;	
		begin
			case s is
				when "00" => d <= A(0);
				when "01" => d <= A(1);
				when "10" => d <= A(2);
				when "11" => d <= A(3);
			end case;
	--	D <= d;
		end process;

end Behavioral;

