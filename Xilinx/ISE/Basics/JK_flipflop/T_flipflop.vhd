----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:36 05/02/2013 
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
    Port (clk : in std_logic;
           T : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end T_flipflop;

architecture Behavioral of T_flipflop is

begin
	process(T,clk)
	variable temp : std_logic;
	begin
		temp = Q;
		Q <= '0';
		Qn <= '0';
		case T is
			when '1' => Q <= not temp;
			when others => null;
		
		end case;
		temp := not Q;
		Qn <= temp;
	end process;	
	


end Behavioral;

