----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:07 07/24/2016 
-- Design Name: 
-- Module Name:    cpu_final - Behavioral 
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

entity cpu_final is
	port(RST:in std_logic;
			CLK:in std_logic;
			ABUS:out std_logic_vector(15 downto 0);
			DBUS:inout std_logic_vector(15 downto 0);
			nMREQ:out std_logic;
			nRD:out std_logic;
			nWR:out std_logic;
			nBHE:out std_logic;
			nBLE:out std_logic;
			--IO
			IOAD:out std_logic_vector(1 downto 0);
			IODB:inout std_logic_vector(7 downto 0);
			nPREQ:out std_logic;
			nPRD:out std_logic;
			nPWR:out std_logic);
end cpu_final;

architecture Behavioral of cpu_final is
	component timer is
		port( clk,rst:in std_logic;
			t:out std_logic_vector(3 downto 0));
	end component;
	
	component fetch is
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
	end component;
	
	component arithmetic is
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
	end component;
	
	component memery_modle is
		port(t2 : in std_logic;
			ALUout:in std_logic_vector(15 downto 0);
			IR:in std_logic_vector(15 downto 0);
			Datain:in std_logic_vector(7 downto 0);
			Dataout:out std_logic_vector(15 downto 0);
			IO:out std_logic;
			rdata:out std_logic;
			wdata:out std_logic);
	end component;
	
	component rewrite is
		port(	t3:in std_logic;
			IR:in std_logic_vector(15 downto 0);
			Rtemp:in std_logic_vector(15 downto 0);
			Rupdate:out std_logic;
			PCupdate:out std_logic;
			Rdata:out std_logic_vector(7 downto 0);
			PCnew:out std_logic_vector(15 downto 0));
	end component;
	
	component contrl is
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
	end component;
	
	signal T:std_logic_vector(3 downto 0);
	signal PCnew:std_logic_vector(15 downto 0);
	signal PCupdate:std_logic;
	signal IRnew:std_logic_vector(15 downto 0);
	signal IR:std_logic_vector(15 downto 0);
	signal PCout:std_logic_vector(15 downto 0);
	signal Irreq:std_logic;
	signal ALUout:std_logic_vector(15 downto 0);
	signal data:std_logic_vector(7 downto 0);
	signal Rtemp:std_logic_vector(15 downto 0);
	signal IO:std_logic;
	signal rdata:std_logic;
	signal wdata:std_logic;
	signal Ridata:std_logic_vector(7 downto 0);
	signal Rupdate:std_logic;
	signal Cy:std_logic;
	signal Z:std_logic;
	signal addr:std_logic_vector(15 downto 0);
begin
	time_contrl:timer PORT MAP(clk=>CLK,rst=>RST,t=>T);
	fecth_model:fetch PORT MAP(clk=>CLK,t0=>T(0),t1=>T(1),rst=>RST,PCupdate=>PCupdate,PCnew=>PCnew,IRnew=>IRnew,IR=>IR,PCout=>PCout,Irreq=>Irreq);
	arithmetic_modle:arithmetic PORT MAP(rst=>RST,t1=>T(1),Rupdate=>Rupdate,Rdata=>Ridata,IR=>IR,Cy=>Cy,z=>Z,ALUout=>ALUout,Addr=>addr,PCin=>PCout);
	memory:memery_modle PORT MAP(t2=>T(2),ALUout=>ALUout,IR=>IR,Datain=>data,Dataout=>Rtemp,IO=>IO,wdata=>wdata,rdata=>rdata);
	rewrite_modle:rewrite PORT MAP(t3=>T(3),IR=>IR,Rtemp=>Rtemp,Rupdate=>Rupdate,PCupdate=>PCupdate,Rdata=>Ridata,PCnew=>PCnew);
	control_modle:contrl PORT MAP(Irreq=>Irreq,wdata=>wdata,rdata=>rdata,IO=>IO,addr=>addr,PCout=>PCout,ALUout=>ALUout,IOAD=>IOAD,IODB=>IODB,wr=>nWR,rd=>nRD,pwr=>nPWR,prd=>nPRD,MREQ=>nMREQ,PREQ=>nPREQ,bhe=>nBHE,ble=>nBLE,IRnew=>IRnew,data=>data,DBUS=>DBUS,abus=>abus);																																																																								
end Behavioral;

