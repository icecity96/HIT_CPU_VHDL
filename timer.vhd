----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:03 07/17/2016 
-- Design Name: 
-- Module Name:    timer - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
	port( clk,rst:in std_logic;
			t:out std_logic_vector(3 downto 0));
end timer;

architecture Behavioral of timer is
	signal temp: std_logic_vector(3 downto 0) := "0000";
begin
	process(clk,rst)
	begin
		if rst='1' then
			temp<="0000";
		elsif clk'event and clk='1' then
			case temp is
				when "0000" => temp<="0001";
				when others => temp<=temp(2 downto 0)&temp(3);
			end case;
		end if;
	end process;
	t<=temp;
end Behavioral;

