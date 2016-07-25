--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:13:57 07/24/2016
-- Design Name:   
-- Module Name:   C:/Users/ice_city/ice_city_cpu/cpu_tb.vhd
-- Project Name:  ice_city_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu_final
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
 
ENTITY cpu_tb IS
END cpu_tb;
 
ARCHITECTURE behavior OF cpu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu_final
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         ABUS : OUT  std_logic_vector(15 downto 0);
         DBUS : INOUT  std_logic_vector(15 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         IOAD : OUT  std_logic_vector(1 downto 0);
         IODB : INOUT  std_logic_vector(7 downto 0);
         nPREQ : OUT  std_logic;
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);
   signal IODB : std_logic_vector(7 downto 0);

 	--Outputs
   signal ABUS : std_logic_vector(15 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal IOAD : std_logic_vector(1 downto 0);
   signal nPREQ : std_logic;
   signal nPRD : std_logic;
   signal nPWR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu_final PORT MAP (
          RST => RST,
          CLK => CLK,
          ABUS => ABUS,
          DBUS => DBUS,
          nMREQ => nMREQ,
          nRD => nRD,
          nWR => nWR,
          nBHE => nBHE,
          nBLE => nBLE,
          IOAD => IOAD,
          IODB => IODB,
          nPREQ => nPREQ,
          nPRD => nPRD,
          nPWR => nPWR
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period;
		CLK <= '1';
		wait for CLK_period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      RST<='1';
		wait for CLK_period*5;
		RST<='0';
		--jmp 命令 X=01010101
		--第一个时钟上升沿
		DBUS<="0000000001010101";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--下一个指令
		--mvi r0，11110000
		--第一个时钟上升沿
		DBUS<="0100000011110000";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--mov r2,r0
		DBUS<="0101001000000000";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--add r3,r0
		--第一个时钟上升沿
		DBUS<="0011001100000000";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--add r2,r0
		--第一个时钟上升沿
		DBUS<="0011001000000000";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--sub r0,r4
		--第一个时钟上升沿
		DBUS<="0010000000000100";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--sub r4,r5
		--第一个时钟上升沿
		DBUS<="0010010000000101";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--sta r0,00001111
		--第一个时钟上升沿
		DBUS<="0110000000001111";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--lda r6,10001111
		--第一个时钟上升沿
		DBUS<="0111011010001111";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		DBUS<="0000000010101010";
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--out r6,01
		--第一个时钟上升沿
		DBUS<="1000011000000001";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--in r5,11
		--第一个时钟上升沿
		DBUS<="1001010100000011";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		IODB<="11111111";
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		IODB<="ZZZZZZZZ";
		--jz r5,00000100 not jump
		--第一个时钟上升沿
		DBUS<="0001010100000100";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		--jz r7,00000100 not jump
		--第一个时钟上升沿
		DBUS<="0001011100000100";
		wait for CLK_period*2;
		--第二个时钟上升沿
		DBUS<="ZZZZZZZZZZZZZZZZ";
		wait for CLK_period*2;
		--第三个时钟上升沿
		wait for CLK_period*2;
		--第四个时钟上升沿
		wait for CLK_period*2;
		wait for CLK_period*2;
		RST<='1';
      wait;
   end process;

END;
