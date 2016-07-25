----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:26:06 07/18/2016 
-- Design Name: 
-- Module Name:    fetch - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fetch is
	port(clk: in std_logic;
			t0: in std_logic;
			t1: in std_logic;
		  rst: in std_logic;
		  PCupdate: in std_logic;
		  PCnew: in std_logic_vector(15 downto 0);
		  IRnew: in std_logic_vector(15 downto 0);
		  IR: out std_logic_vector(15 downto 0);
		  PCout: out std_logic_vector(15 downto 0);
		  Irreq:out std_logic);
end fetch;

architecture Behavioral of fetch is
	signal PC: std_logic_vector(15 downto 0):="0000000000000001";
	signal IR_value: std_logic_vector(15 downto 0);
begin
	process(clk,rst,t0,t1,PCupdate)
	begin
		if rst='1' then
			PC<="0000000000000000";
			Irreq<='0';
		elsif t0='1' then
			Irreq<='1';
			IR_value<=IRnew;
		elsif t1='1' and clk'event and clk='1' then
			PC<=PC+1;
			Irreq<='0';
		elsif PCupdate='1' then
			PC<=PCnew;
		end if;
	end process;
	IR<=IR_value;
	PCout<=PC;
end Behavioral;

