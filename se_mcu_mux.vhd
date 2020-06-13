library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity se_mux2 is
    Port ( sel      : in  std_logic_vector(1 downto 0);
           gpio_o   : in std_logic;
           spi_clk  : in std_logic;
           spi_mosi : in std_logic;
           spi_miso : out std_logic;
           L2       : inout std_logic;
           L1       : out std_logic;
           gpio_i   : out std_logic;
           clk      : in std_logic );
end se_mux2;

architecture arch2 of se_mux2 is
begin

            L1       <= gpio_o   when sel = "00" else spi_clk;
           gpio_i   <= L2       when sel = "00" else '1';
            L2       <= spi_mosi when sel = "01" else 'Z';
            spi_miso <= L2       when sel = "10" else '1';

end arch2;

---------------------------------------------
------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mcu_mux2 is
    Port ( sel      : in  std_logic_vector(1 downto 0);
           gpio_o   : in std_logic;
           spi_clk  : out std_logic;
           spi_mosi : out std_logic;
           spi_miso : in std_logic;
           L2       : inout std_logic;
           L1       : in std_logic;
           gpio_i   : out std_logic;
           clk      : in std_logic );
end mcu_mux2;


architecture arch2 of mcu_mux2 is
begin
   gpio_i   <= L1       when sel = "00" else 'Z';
   L2       <= gpio_o   when sel = "00" else spi_miso when sel = "10" else 'Z';
    spi_clk  <= L1       when sel = "01" or sel = "10" else 'Z';
    spi_mosi <= L2       when sel = "01" else 'Z';
end arch2;
