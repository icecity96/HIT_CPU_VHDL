----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:58 07/23/2016 
-- Design Name: 
-- Module Name:    contrl - Behavioral 
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

entity contrl is
	port(Irreq:in std_logic;
			wdata:in std_logic;
			rdata:in std_logic;
			IO:in std_logic;
			addr:in std_logic_vector(15 downto 0);
			PCout:in std_logic_vector(15 downto 0);
			ALUout:in std_logic_vector(15 downto 0);
			IOAD:out std_logic_vector(1 downto 0);
			IODB:inout std_logic_vector(7 downto 0);
			wr:out std_logic;
			rd:out std_logic;
			pwr:out std_logic;
			prd:out std_logic;
			MREQ:out std_logic;
			PREQ:out std_logic;
			bhe:out std_logic;
			ble:out std_logic;
			IRnew:out std_logic_vector(15 downto 0);
			abus:out std_logic_vector(15 downto 0);
			data:out std_logic_vector(7 downto 0);
			DBUS:inout std_logic_vector(15 downto 0));
end contrl;

architecture Behavioral of contrl is

begin
	process(Irreq,wdata,addr,PCout,ALUout,IO,DBUS,IODB)
	begin
		if Irreq = '0' then
			abus<=addr;
		end if;
		--取址
		if Irreq = '1' then
			abus<=PCout;
			IRnew<=DBUS;
			DBUS<="ZZZZZZZZZZZZZZZZ";
			MREQ<='0';
			rd<='0';wr<='1';pwr<='1';prd<='1';
			PREQ<='1';bhe<='0';ble<='0';
		--向内存写数据
		elsif wdata='1' and rdata = '0' and IO='0' then
			DBUS<=ALUout;
			rd<='1';wr<='0';pwr<='1';prd<='1';
			MREQ<='0';PREQ<='1';bhe<='1';ble<='0';
		--读内存中的数据
		elsif wdata='0' and rdata = '1' and IO='0' then
			data<=DBUS(7 downto 0);
			DBUS<="ZZZZZZZZZZZZZZZZ";
			rd<='0';wr<='1';pwr<='1';prd<='1';
			MREQ<='0';PREQ<='1';bhe<='1';ble<='0';
		--向IO中写数
		elsif wdata='1' and rdata = '0' and IO='1' then
			IOAD<=addr(1 downto 0);
			IODB<=ALUout(7 downto 0);
			rd<='1';wr<='1';pwr<='0';prd<='1';
			MREQ<='1';PREQ<='0';bhe<='1';ble<='1';
		--从IO中读入数据
		elsif wdata='0' and rdata = '1' and IO='1' then
			IOAD<=addr(1 downto 0);
			data<=IODB;
			IODB<="ZZZZZZZZ";
			rd<='1';wr<='1';pwr<='1';prd<='0';
			MREQ<='1';PREQ<='0';bhe<='1';ble<='1';
		end if;
	end process;

end Behavioral;

