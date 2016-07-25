--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:58:15 07/24/2016
-- Design Name:   
-- Module Name:   C:/Users/ice_city/ice_city_cpu/contrl_tb.vhd
-- Project Name:  ice_city_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contrl
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
 
ENTITY contrl_tb IS
END contrl_tb;
 
ARCHITECTURE behavior OF contrl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contrl
    PORT(
         Irreq : IN  std_logic;
         wdata : IN  std_logic;
         rdata : IN  std_logic;
         IO : IN  std_logic;
         addr : IN  std_logic_vector(15 downto 0);
         PCout : IN  std_logic_vector(15 downto 0);
         ALUout : IN  std_logic_vector(15 downto 0);
         in0 : IN  std_logic_vector(7 downto 0);
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         in3 : IN  std_logic_vector(7 downto 0);
         out0 : OUT  std_logic_vector(7 downto 0);
         out1 : OUT  std_logic_vector(7 downto 0);
         out2 : OUT  std_logic_vector(7 downto 0);
         out3 : OUT  std_logic_vector(7 downto 0);
         wr : OUT  std_logic;
         rd : OUT  std_logic;
         pwr : OUT  std_logic;
         prd : OUT  std_logic;
         MREQ : OUT  std_logic;
         PREQ : OUT  std_logic;
         bhe : OUT  std_logic;
         ble : OUT  std_logic;
         IRnew : OUT  std_logic_vector(15 downto 0);
         abus : OUT  std_logic_vector(15 downto 0);
         data : OUT  std_logic_vector(7 downto 0);
         DBUS : INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Irreq : std_logic := '0';
   signal wdata : std_logic := '0';
   signal rdata : std_logic := '0';
   signal IO : std_logic := '0';
   signal addr : std_logic_vector(15 downto 0) := (others => '0');
   signal PCout : std_logic_vector(15 downto 0) := (others => '0');
   signal ALUout : std_logic_vector(15 downto 0) := (others => '0');
   signal in0 : std_logic_vector(7 downto 0) := (others => '0');
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal in2 : std_logic_vector(7 downto 0) := (others => '0');
   signal in3 : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);

 	--Outputs
   signal out0 : std_logic_vector(7 downto 0);
   signal out1 : std_logic_vector(7 downto 0);
   signal out2 : std_logic_vector(7 downto 0);
   signal out3 : std_logic_vector(7 downto 0);
   signal wr : std_logic;
   signal rd : std_logic;
   signal pwr : std_logic;
   signal prd : std_logic;
   signal MREQ : std_logic;
   signal PREQ : std_logic;
   signal bhe : std_logic;
   signal ble : std_logic;
   signal IRnew : std_logic_vector(15 downto 0);
   signal abus : std_logic_vector(15 downto 0);
   signal data : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contrl PORT MAP (
          Irreq => Irreq,
          wdata => wdata,
          rdata => rdata,
          IO => IO,
          addr => addr,
          PCout => PCout,
          ALUout => ALUout,
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          out0 => out0,
          out1 => out1,
          out2 => out2,
          out3 => out3,
          wr => wr,
          rd => rd,
          pwr => pwr,
          prd => prd,
          MREQ => MREQ,
          PREQ => PREQ,
          bhe => bhe,
          ble => ble,
          IRnew => IRnew,
          abus => abus,
          data => data,
          DBUS => DBUS
        );

   -- Stimulus process
   stim_proc: process
   begin		
		Irreq <= '0';
		wait for 10 ns;
		Irreq<='1';
		PCout<="0000000011111111";
		DBUS<="1111111100000000";
		wait for 10 ns;
		Irreq<='0';
      wait;
   end process;

END;
