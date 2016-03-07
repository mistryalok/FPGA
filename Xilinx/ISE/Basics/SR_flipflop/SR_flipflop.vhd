----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:19 05/02/2013 
-- Design Name: 
-- Module Name:    SR_flipflop - Behavioral 
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

entity SR_flipflop is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  std_logic;
           Qn : out std_logic);
end SR_flipflop;

architecture Behavioral of SR_flipflop is

begin	

	process(S,R)
	begin
			Q <= '0';
			Qn <= '0';
		if(s= '1')then 
			Q<= '1';
			Qn <='0';
		elsif (R= '1') then
			Q<= '0';
			Qn <= '1';
	end if;
	
	end process;
		
	
end Behavioral;

