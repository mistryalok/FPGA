----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:45 05/22/2013 
-- Design Name: 
-- Module Name:    MUX2x1vi - Behavioral 
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

entity MUX2x1vi is
    Port ( I : in  STD_LOGIC_VECTOR (1 downto 0);
           S : in  STD_LOGIC;
           O : out  STD_LOGIC);
end MUX2x1vi;

architecture Behavioral of MUX2x1vi is

begin

	process(S,I)
	begin	
		case s is
			when '0' => O <= I(0);
			when '1' => O <= I(1);
			when others => Null;
		end case;
	end process;


	


end Behavioral;

