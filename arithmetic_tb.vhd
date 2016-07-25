--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:02:04 07/21/2016
-- Design Name:   
-- Module Name:   C:/Users/ice_city/ice_city_cpu/arithmetic_tb.vhd
-- Project Name:  ice_city_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arithmetic
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY arithmetic_tb IS
END arithmetic_tb;
 
ARCHITECTURE behavior OF arithmetic_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arithmetic
    PORT(
         rst : IN  std_logic;
         t1 : IN  std_logic;
         Rupdate : IN  std_logic;
         Rdata : IN  std_logic_vector(7 downto 0);
         IR : IN  std_logic_vector(15 downto 0);
         z : OUT  std_logic;
			Cy:out std_logic;
         ALUout : OUT  std_logic_vector(15 downto 0);
         Addr : OUT  std_logic_vector(15 downto 0);
         PCin : IN  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal t1 : std_logic := '0';
   signal Rupdate : std_logic := '0';
   signal Rdata : std_logic_vector(7 downto 0) := (others => '0');
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
   signal PCin : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal z : std_logic;
	signal Cy: std_logic;
   signal ALUout : std_logic_vector(15 downto 0);
   signal Addr : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmetic PORT MAP (
          rst => rst,
          t1 => t1,
          Rupdate => Rupdate,
          Rdata => Rdata,
          IR => IR,
          z => z,
			 Cy => Cy,
          ALUout => ALUout,
          Addr => Addr,
          PCin => PCin
        );

   stim_proc: process
   begin		
		rst<='1';
		wait for 10 ns;
		rst<='0';
		Rupdate<='1';
		--set reg1 t0 FF
		IR(10 downto 8)<="001";
		Rdata<="11111111";
		wait for 10 ns;
		--set reg2 t0 FE
		IR(10 downto 8)<="010";
		Rdata<="11111110";
		wait for 10 ns;
		--set reg7 t0 FE
		IR(10 downto 8)<="111";
		Rdata<="10111110";
		wait for 10 ns;
		Rupdate<='0';
		t1<='1';
		--jmp
		IR<="0000000001010101";
		wait for 10 ns;
		t1<='0';
		wait for 10 ns;
		t1<='1';
		--jz use reg1 not zero jump -
		IR<="0001000111111111";
		PCin<="0000000000000001";
		wait for 10 ns;
		t1<='0';
		wait for 10 ns;
		t1<='1';
		--jz use reg1 not zero jump +
		IR<="0001000101111111";
		PCin<="0000000000000001";
		wait for 10 ns;
		t1<='0';
		wait for 10 ns;
		t1<='1';
		--jz use reg0 is zero not jump
		IR<="0001000000000011";
		PCin<="0000000000000001";
      wait for 10 ns;
		--sub r2,r1
		t1<='0';
		wait for 10 ns;
		t1<='1';
		IR<="0010001000000001";
		wait for 10 ns;
		--add r2,r0
		t1<='0';
		wait for 10 ns;
		t1<='1';
		IR<="0011001000000000";
		wait for 10 ns;
		--mvi
		t1<='0';
		wait for 10 ns;
		t1<='1';
		IR<="0100001010001000";
		wait for 10 ns;
		--mov
		t1<='0';
		wait for 10 ns;
		t1<='1';
		IR<="0101001010000001";
		wait for 10 ns;
		--sta
		t1<='0';
		wait for 10 ns;
		t1<='1';
		IR<="0110001010000001";
		wait for 10 ns;
		--lda
		t1<='0';
		wait for 10 ns;
		t1<='1';
		IR<="0111001010000011";
		wait for 10 ns;
		wait;
   end process;

END;
