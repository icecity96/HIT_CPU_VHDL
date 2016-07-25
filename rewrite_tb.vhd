--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:57:27 07/23/2016
-- Design Name:   
-- Module Name:   C:/Users/ice_city/ice_city_cpu/rewrite_tb.vhd
-- Project Name:  ice_city_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rewrite
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
 
ENTITY rewrite_tb IS
END rewrite_tb;
 
ARCHITECTURE behavior OF rewrite_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rewrite
    PORT(
         t3 : IN  std_logic;
         IR : IN  std_logic_vector(15 downto 0);
         Rtemp : IN  std_logic_vector(15 downto 0);
         Rupdate : OUT  std_logic;
         PCupdate : OUT  std_logic;
         Rdata : OUT  std_logic_vector(7 downto 0);
         PCnew : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal t3 : std_logic := '0';
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
   signal Rtemp : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Rupdate : std_logic;
   signal PCupdate : std_logic;
   signal Rdata : std_logic_vector(7 downto 0);
   signal PCnew : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rewrite PORT MAP (
          t3 => t3,
          IR => IR,
          Rtemp => Rtemp,
          Rupdate => Rupdate,
          PCupdate => PCupdate,
          Rdata => Rdata,
          PCnew => PCnew
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
		t3<='1';
	  --jump
	  IR<="0000000001010101";
	  Rtemp<="1000000001010101";
	  wait for 10 ns;
	  --jz
	  IR<="0001000111111111";
	  Rtemp<="0000000000000001";
	  wait for 10 ns;
	  --sub
	  IR<="0010001000000001";
	  Rtemp<="0000000011111111";
	  wait for 10 ns;
	  --add
	  IR<="0011001000000000";
	  Rtemp<="0000000000000000";
	  wait for 10 ns;
	  --mvi
	  IR<="0100001010001000";
	  Rtemp<="0000000000000010";
	  wait for 10 ns;
	  --mov
	  IR<="0101001010000001";
	  Rtemp<="0000000000000011";
	  wait for 10 ns;
	  --sta
	  IR<="0110001010000001";
	  Rtemp<="0000000000000001";
	  wait for 10 ns;
	  --lad
	  IR<="0111001010000011";
	   Rtemp<="0000000000000111";
	  wait for 10 ns;
	  --in
	  IR<="1001001010000011";
	  Rtemp<="0000000000001011";
	  wait for 10 ns;
	  --out
	  IR<="1000001010000011";
	   Rtemp<="0000000000011011";
	  wait for 10 ns;
      wait;
   end process;

END;
