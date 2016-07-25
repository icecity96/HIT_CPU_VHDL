----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:05 07/22/2016 
-- Design Name: 
-- Module Name:    memery_modle - Behavioral 
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

entity memery_modle is
	port(t2 : in std_logic;
			ALUout:in std_logic_vector(15 downto 0);
			IR:in std_logic_vector(15 downto 0);
			Datain:in std_logic_vector(7 downto 0);
			Dataout:out std_logic_vector(15 downto 0);
			IO:out std_logic;
			rdata:out std_logic;
			wdata:out std_logic);
end memery_modle;

architecture Behavioral of memery_modle is
	signal Rtemp:std_logic_vector(15 downto 0);
begin
	process(t2,IR,ALUout,IR,Rtemp,Datain)
	begin
		if t2 = '1' then
			case IR(15 downto 11) is
				when "01100" => 
					wdata<='1'; rdata<='0';IO<='0';
				when "01110" =>
					wdata<='0'; rdata<='1';IO<='0';
					Rtemp<="00000000"&Datain;
				when "10000" =>
					wdata<='1';rdata<='0';IO<='1';
				when	"10010" =>
					wdata<='0'; rdata<='1';IO<='1';
					Rtemp<="00000000"&Datain;
				when others =>
					wdata<='0';rdata<='0';IO<='0';
					Rtemp<=ALUout;
			end case;	
		end if;
		Dataout<=Rtemp;
	end process;

end Behavioral;

