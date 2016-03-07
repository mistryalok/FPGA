----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:49 05/22/2013 
-- Design Name: 
-- Module Name:    HA_adder - Behavioral 
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

entity HA_adder is
    Port ( A : in  STD_LOGIC;
				B :in std_logic ;
           S : out  STD_LOGIC;
           C : out  STD_LOGIC);
end HA_adder;

architecture Behavioral of HA_adder is

begin
	s <= a xor b;
	c <= a and b;
	


end Behavioral;

