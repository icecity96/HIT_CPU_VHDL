----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:33 07/23/2016 
-- Design Name: 
-- Module Name:    rewrite - Behavioral 
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

entity rewrite is
	port(	t3:in std_logic;
			IR:in std_logic_vector(15 downto 0);
			Rtemp:in std_logic_vector(15 downto 0);
			Rupdate:out std_logic;
			PCupdate:out std_logic;
			Rdata:out std_logic_vector(7 downto 0);
			PCnew:out std_logic_vector(15 downto 0));
end rewrite;

architecture Behavioral of rewrite is

begin
	process(IR,t3,Rtemp)
	begin
		if t3 = '1' then
			case IR(15 downto 11) is
				--jMP
				when "00000" =>
					PCnew<=Rtemp;
					PCupdate<='1';
					Rupdate<='0';
				--jz
				when "00010" =>
					PCnew<=Rtemp;
					PCupdate<='1';
					Rupdate<='0';
				--sub
				when "00100" =>
					Rdata<=Rtemp(7 downto 0);
					PCupdate<='0';
					Rupdate<='1';
				--add
				when "00110" =>
					Rdata<=Rtemp(7 downto 0);
					PCupdate<='0';
					Rupdate<='1';
				--mvi
				when "01000" =>
					Rdata<=Rtemp(7 downto 0);
					PCupdate<='0';
					Rupdate<='1';
				--mov
				when "01010" =>
					Rdata<=Rtemp(7 downto 0);
					PCupdate<='0';
					Rupdate<='1';
				--sta
				when "01100" =>
					null;
				--lda
				when "01110" =>
					Rdata<=Rtemp(7 downto 0);
					PCupdate<='0';
					Rupdate<='1';
				--out
				when "10000" =>
					null;
				--in
				when "10010" =>
					Rdata<=Rtemp(7 downto 0);
					PCupdate<='0';
					Rupdate<='1';
				when others => null;
			end case;
		else
			PCupdate<='0';
			Rupdate<='0';
		end if;
	end process;
end Behavioral;

