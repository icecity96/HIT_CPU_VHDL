--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:59:07 07/24/2016
-- Design Name:   
-- Module Name:   C:/Users/ice_city/ice_city_cpu/control_tb.vhd
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
 
ENTITY control_tb IS
END control_tb;
 
ARCHITECTURE behavior OF control_tb IS 
 
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
         IOAD : OUT  std_logic_vector(1 downto 0);
         IODB : INOUT  std_logic_vector(7 downto 0);
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

	--BiDirs
   signal IODB : std_logic_vector(7 downto 0);
   signal DBUS : std_logic_vector(15 downto 0);

 	--Outputs
   signal IOAD : std_logic_vector(1 downto 0);
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
          IOAD => IOAD,
          IODB => IODB,
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
		DBUS<="ZZZZZZZZZZZZZZZZ";
		Irreq<='0';
		--向内存写数据
		wdata<='1';
		rdata<='0';
		IO<='0';
		addr<="0011001100110011";
		ALUout<="0000000010001000";
		wait for 10 ns;
		--从内存中读取数据
		wdata<='0';
		rdata<='1';
		IO<='0';
		addr<="1111000011110000";
		DBUS<="1000100011111111";
		wait for 10 ns;
		--从IO中读取数据
		wdata<='0';
		rdata<='1';
		IO<='1';
		addr<="0000000000000010";
		IODB<="11001100";
		wait for 10 ns;
		IODB<="ZZZZZZZZ";
		--向IO中写入数据
		wdata<='1';
		rdata<='0';
		IO<='1';
		addr<="0000000000000011";
		ALUout<="0000000011101110";
      wait;
   end process;

END;
