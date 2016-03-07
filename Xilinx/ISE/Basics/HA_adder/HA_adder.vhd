----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:52:35 05/02/2013 
-- Design Name: 
-- Module Name:    HA_adder - dataflow 
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
    Port ( a : in  std_logic;
           b : in  std_logic;
           c : out  std_logic;
           s : out  std_logic);
end HA_adder;

architecture dataflow of HA_adder is

begin
	S<= a xor b;
	c<= a and b;


end dataflow;

