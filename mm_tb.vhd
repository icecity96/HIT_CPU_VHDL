--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:28:35 07/23/2016
-- Design Name:   
-- Module Name:   C:/Users/ice_city/ice_city_cpu/mm_tb.vhd
-- Project Name:  ice_city_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memery_modle
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
 
ENTITY mm_tb IS
END mm_tb;
 
ARCHITECTURE behavior OF mm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memery_modle
    PORT(
         t2 : IN  std_logic;
         ALUout : IN  std_logic_vector(15 downto 0);
         IR : IN  std_logic_vector(15 downto 0);
         Datain : IN  std_logic_vector(7 downto 0);
         Dataout : OUT  std_logic_vector(15 downto 0);
         IO : OUT  std_logic;
         rdata : OUT  std_logic;
         wdata : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal t2 : std_logic := '0';
   signal ALUout : std_logic_vector(15 downto 0) := (others => '0');
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
   signal Datain : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Dataout : std_logic_vector(15 downto 0);
   signal IO : std_logic;
   signal rdata : std_logic;
   signal wdata : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memery_modle PORT MAP (
          t2 => t2,
          ALUout => ALUout,
          IR => IR,
          Datain => Datain,
          Dataout => Dataout,
          IO => IO,
          rdata => rdata,
          wdata => wdata
        );

   -- Stimulus process
   stim_proc: process
   begin		
     t2<='1';
	  --jump
	  IR<="0000000001010101";
	  ALUout<="1000000001010101";
	  wait for 10 ns;
	  --jz
	  IR<="0001000111111111";
	  ALUout<="0000000000000001";
	  wait for 10 ns;
	  --sub
	  IR<="0010001000000001";
	  ALUout<="0000000011111111";
	  wait for 10 ns;
	  --add
	  IR<="0011001000000000";
	  ALUout<="0000000000000000";
	  wait for 10 ns;
	  --mvi
	  IR<="0100001010001000";
	  ALUout<="0000000000000010";
	  wait for 10 ns;
	  --mov
	  IR<="0101001010000001";
	  ALUout<="0000000000000011";
	  wait for 10 ns;
	  ALUout<="0000000000000000";
	  --sta
	  IR<="0110001010000001";
	  wait for 10 ns;
	  --lad
	  IR<="0111001010000011";
	  Datain<="11001100";
	  wait for 10 ns;
	  --in
	  IR<="1001001010000011";
	  Datain<="11111111";
	  wait for 10 ns;
	  --out
	  IR<="1000001010000011";
	  wait for 10 ns;
     wait;
   end process;

END;
