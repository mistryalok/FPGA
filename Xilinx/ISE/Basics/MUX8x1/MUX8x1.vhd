----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:54 04/04/2013 
-- Design Name: 
-- Module Name:    MUX8x1 - Behavioral 
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

entity MUX8x1 is
    Port ( w : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           f : out  STD_LOGIC);
end MUX8x1;

architecture Behavioral of MUX8x1 is
signal m: bit_vector(0 to 1);

	component mux2x1
		port( a : in bit_vector(1 downto 0);
				b : in bit;
				c: out bit);
	end component;

	component mux4x1
		port( a :in bit_vector(3 downto 0);
			b : in bit_vector( 1 downto 0);
			c : out bit);
	end component;
	
			begin
				mx1: mux2x1 port map(a(0),a(1),b,c);
				mx2: mux4x1 port map(a(0),a(1),a(2),a(3),b(1 downto 0),c);
	

end Behavioral;

