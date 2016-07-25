--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:09:08 07/19/2016
-- Design Name:   
-- Module Name:   C:/Users/ice_city/ice_city_cpu/fetch_tb.vhd
-- Project Name:  ice_city_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fetch
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
 
ENTITY fetch_tb IS
END fetch_tb;
 
ARCHITECTURE behavior OF fetch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fetch
    PORT(
         clk : IN  std_logic;
         t0 : IN  std_logic;
         t1 : IN  std_logic;
         rst : IN  std_logic;
         PCupdate : IN  std_logic;
         PCnew : IN  std_logic_vector(15 downto 0);
         IRnew : IN  std_logic_vector(15 downto 0);
         IR : OUT  std_logic_vector(15 downto 0);
         PCout : OUT  std_logic_vector(15 downto 0);
         Irreq : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal t0 : std_logic := '0';
   signal t1 : std_logic := '0';
   signal rst : std_logic := '0';
   signal PCupdate : std_logic := '0';
   signal PCnew : std_logic_vector(15 downto 0) := (others => '0');
   signal IRnew : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal IR : std_logic_vector(15 downto 0);
   signal PCout : std_logic_vector(15 downto 0);
   signal Irreq : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fetch PORT MAP (
          clk => clk,
          t0 => t0,
          t1 => t1,
          rst => rst,
          PCupdate => PCupdate,
          PCnew => PCnew,
          IRnew => IRnew,
          IR => IR,
          PCout => PCout,
          Irreq => Irreq
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		t0<='1';
		IRnew<="0001000100010001";
      wait for clk_period;
		t0<='0';
		t1<='1';
		wait for clk_period;
		t1<='0';
		PCupdate<='1';
		PCnew<="1000000000000000";
		wait for clk_period;
		PCupdate<='0';
		PCnew<="1000000000000001";
		wait for clk_period;
      wait;
   end process;

END;
