----------------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Author:  Mircea Dabacan
--          Copyright 2014 Digilent, Inc.
----------------------------------------------------------------------------
-- 
-- Create Date:    13:13:49 12/16/2010 
-- Design Name: 
-- Module Name:    sSegDisplay - Behavioral 
-- Description: 
--    This module represents the seven-segment display multiplexer
--    Because the pattern to be displayed does not contain numerical or
--    alphabetical characters representable on a seven-segment display,
--    the incoming data is NOT encoded to seven-segment code, 
--    instead the incoming data is sent directly to the cathodes, 
--    according to the diagram shown below
-- segment encoding
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3
--  Decimal Point = 7
--  0011 1111
--  0000 0110
--  0101 1011
--  0100 1111
--  0110 0110
--  0110 1101
--  0111 1101
--  0000 0111
--  0111 1111
--  0110 1111
--  0111 0111
--  0111 1100
--  0101 1000
--  0101 1110
--  0111 1001
--  0111 0001 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;	-- add to do arithmetic operations
use IEEE.std_logic_arith.all;		-- add to do arithmetic operations

entity sSegDisplay is
    Port(ck      : in  std_logic;                          -- 100MHz system clock
		bits     : in  std_logic_vector (31 downto 0); -- eight digit number to be displayed
		clear    : in  std_logic_vector (31 downto 0);
		loopback : out std_logic_vector (31 downto 0);
		dbg0      : out std_logic;
		dbg1      : out std_logic;
		dbg2      : out std_logic;
		dbg3      : out std_logic;
		dbg4      : out std_logic;
		dbg5      : out std_logic;
		dbg6      : out std_logic;
		dbg7      : out std_logic;
		seg : out  std_logic_vector (7 downto 0);    -- display cathodes
		an : out  std_logic_vector (7 downto 0));    -- display anodes (active-low, due to transistor complementing)
end sSegDisplay;

architecture Behavioral of sSegDisplay is
component bits2hex is
    Port( bits : in  std_logic_vector (3 downto 0); -- eight digit number to be displayed
		  hex :  out std_logic_vector (7 downto 0));
end component;

	signal cnt: std_logic_vector(19 downto 0); -- divider counter for ~95.3Hz refresh rate (with 100MHz main clock)
	signal hex: std_logic_vector(7 downto 0);  -- hexadecimal digit
	signal intAn: std_logic_vector(7 downto 0); -- internal signal representing anode data
    signal number: std_logic_vector(63 downto 0);
begin

   -- Assign outputs
   an <= intAn;
   seg <= hex;
   loopback <= bits;
   dbg0 <= bits(0);
   dbg1 <= bits(1);
   dbg2 <= bits(2);
   dbg3 <= bits(3);
   dbg4 <= bits(4);
   dbg5 <= bits(5);
   dbg6 <= bits(6);
   dbg7 <= bits(7);

   seg0: bits2hex
   port map(
      bits   => bits(3 downto 0), -- 64-bit
      hex    => number(7 downto 0));
   seg1: bits2hex
   port map(
      bits   => bits(7 downto 4), -- 64-bit
      hex    => number(15 downto 8));
   seg2: bits2hex
   port map(
      bits   => bits(11 downto 8), -- 64-bit
      hex    => number(23 downto 16));
   seg3: bits2hex
   port map(
      bits   => bits(15 downto 12), -- 64-bit
      hex    => number(31 downto 24));
   seg4: bits2hex
   port map(
      bits   => bits(19 downto 16), -- 64-bit
      hex    => number(39 downto 32));
   seg5: bits2hex
   port map(
      bits   => bits(23 downto 20), -- 64-bit
      hex    => number(47 downto 40));
   seg6: bits2hex
   port map(
      bits   => bits(27 downto 24), -- 64-bit
      hex    => number(55 downto 48));
   seg7: bits2hex
   port map(
      bits   => bits(31 downto 28), -- 64-bit
      hex    => number(63 downto 56));

   clockDivider: process(ck)
   begin
      if ck'event and ck = '1' then
         cnt <= cnt + '1';
      end if;
   end process clockDivider;

   -- Anode Select
   with cnt(19 downto 17) select -- 100MHz/2^20 = 95.3Hz
      intAn <=    
         "11111110" when "000",
         "11111101" when "001",
         "11111011" when "010",
         "11110111" when "011",
         "11101111" when "100",
         "11011111" when "101",
         "10111111" when "110",
         "01111111" when others;

   -- Digit Select
   with cnt(19 downto 17) select -- 100MHz/2^20 = 95.3Hz
      hex <=      
         number(7 downto 0)   when "000",
         number(15 downto 8)  when "001",
         number(23 downto 16) when "010",
         number(31 downto 24) when "011",
         number(39 downto 32) when "100",
         number(47 downto 40) when "101",
         number(55 downto 48) when "110",
         number(63 downto 56) when others;

end Behavioral;

----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;	-- add to do arithmetic operations
use IEEE.std_logic_arith.all;		-- add to do arithmetic operations

entity bits2hex is
    Port( bits : in  std_logic_vector (3 downto 0); -- eight digit number to be displayed
		  hex :  out std_logic_vector (7 downto 0));
end bits2hex;

architecture arch1 of bits2hex is
begin

    with bits select
        hex <= "11000000" when "0000",
               "11111001" when "0001",
               "10100100" when "0010",
               "10110000" when "0011",
               "10011001" when "0100",
               "10010010" when "0101",
               "10000010" when "0110",
               "11111000" when "0111",
               "10000000" when "1000",
               "10010000" when "1001",
               "10001000" when "1010",
               "10000011" when "1011",
               "10100111" when "1100",
               "10100001" when "1101",
               "10000110" when "1110",
               "10001110" when "1111";
end arch1;

