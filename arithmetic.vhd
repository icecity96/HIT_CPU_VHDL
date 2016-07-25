----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:53:32 07/19/2016 
-- Design Name: 
-- Module Name:    arithmetic - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity arithmetic is
	port(rst:in std_logic;
			t1:in std_logic;
			Rupdate:in std_logic;
			Rdata:in std_logic_vector(7 downto 0);
			IR:in std_logic_vector(15 downto 0);
			Cy:out std_logic;
			z:out std_logic;
			ALUout:out std_logic_vector(15 downto 0);
			Addr:out std_logic_vector(15 downto 0);
			PCin:in std_logic_vector(15 downto 0));
end arithmetic;

architecture Behavioral of arithmetic is
	type regester is array(0 to 7) of std_logic_vector(7 downto 0);
	signal Reg: regester;
	signal Reg_A,Reg_B:std_logic_vector(7 downto 0);
	shared variable ALU:std_logic_vector(8 downto 0);
	signal addr_temp:std_logic_vector(15 downto 0);
	signal Cy_temp:std_logic;
	signal Z_temp:std_logic;
	signal Raddr:integer;
begin
	process(t1,IR,rst,Rupdate,Reg_A,Reg_B,Raddr,Rdata,Z_temp,Cy_temp,addr_temp,PCin)
	begin
		--when rst is '1' ,reset the arithmetic modle
		if rst = '1' then
			for i in 0 to 7 loop
				Reg(i)<="00000000";
			end loop;
			Z_temp<='0';
			Cy_temp<='0';
			addr_temp<="ZZZZZZZZZZZZZZZZ";
			ALU :="ZZZZZZZZZ";
		elsif Rupdate = '1' then
			Reg(conv_integer(IR(10 downto 8)))<=Rdata;
		elsif t1 = '1' then
			Reg_A<=Reg(conv_integer(IR(10 downto 8)));
			Reg_B<=Reg(conv_integer(IR(2 downto 0)));
			case IR(15 downto 11) is
				--jMP
				when "00000" =>
					ALUout<=Reg(7)&IR(7 downto 0);
				--jz
				when "00010" =>
					if Reg_A = "00000000" then
						if IR(7)='0' then
							ALUout<=PCin+("00000000"&IR(7 downto 0));
						else
							ALUout<=PCin-("0000000100000000"-IR(7 downto 0));
						end if;
					else
						ALUout<=PCin+'1';
					end if;
				--sub
				when "00100" =>
					ALU :=("0"&Reg_A)-("0"&Reg_B)-("0"&Cy_temp);
					ALUout<="00000000"&ALU(7 downto 0);
				--add
				when "00110" =>
					ALU:=("0"&Reg_A)+("0"&Reg_B)+("0"&Cy_temp);
					ALUout<="00000000"&ALU(7 downto 0);
				--mvi
				when "01000" =>
					ALUout<="00000000"&IR(7 downto 0);
				--mov
				when "01010" =>
					ALUout<="00000000"&Reg_B;
				--sta
				when "01100" =>
					addr_temp<=Reg(7)&IR(7 downto 0);
					ALUout<="00000000"&Reg(conv_integer(IR(10 downto 8)));
				--lda
				when "01110" =>
					addr_temp<=Reg(7)&IR(7 downto 0);
				--out
				when "10000" =>
					addr_temp(1 downto 0)<=IR(1 downto 0);
					ALUout<="00000000"&Reg_A;
				--in
				when "10010" =>
					addr_temp(1 downto 0)<=IR(1 downto 0);
				when others => null;
			end case;
		elsif t1 = '0' then
			if ALU(8) = '1' then
				Cy_temp<='1';
			else
				Cy_temp<='0';
			end if;
			if ALU="000000000" then 
				Z_temp<='1';
			else
				Z_temp<='0';
			end if;
		end if;
		z<=Z_temp;
		Cy<=Cy_temp;
		Addr<=addr_temp;
	end process;
	
		
end Behavioral;

