library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- GPIO splitter
entity io8gpio_splitter is
    Port ( gpio_i : out STD_LOGIC_VECTOR (7 downto 0);
           gpio_o : in STD_LOGIC_VECTOR (7 downto 0);
           gpio_t : in STD_LOGIC_VECTOR (7 downto 0);
           io0    : inout std_logic; 
           io1    : inout std_logic; 
           io2    : inout std_logic; 
           io3    : inout std_logic; 
           io4    : inout std_logic; 
           io5    : inout std_logic; 
           io6    : inout std_logic; 
           io7    : inout std_logic; 
           clk    : in std_logic );
end io8gpio_splitter;

architecture archi of io8gpio_splitter is
begin
    io0 <= gpio_o(0) when gpio_t(0) = '0' else 'Z';
    io1 <= gpio_o(1) when gpio_t(1) = '0' else 'Z';
    io2 <= gpio_o(2) when gpio_t(2) = '0' else 'Z';
    io3 <= gpio_o(3) when gpio_t(3) = '0' else 'Z';
    io4 <= gpio_o(4) when gpio_t(4) = '0' else 'Z';
    io5 <= gpio_o(5) when gpio_t(5) = '0' else 'Z';
    io6 <= gpio_o(6) when gpio_t(6) = '0' else 'Z';
    io7 <= gpio_o(7) when gpio_t(7) = '0' else 'Z';    
    gpio_i(0) <= io0;
    gpio_i(1) <= io1;
    gpio_i(2) <= io2;
    gpio_i(3) <= io3;
    gpio_i(4) <= io4;
    gpio_i(5) <= io5;
    gpio_i(6) <= io6;
    gpio_i(7) <= io7;
end archi;
---------------------------------------------------------------------
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- GPIO splitter
entity io4gpio_splitter is
    Port ( gpio_i : out STD_LOGIC_VECTOR (3 downto 0);
           gpio_o : in STD_LOGIC_VECTOR (3 downto 0);
           gpio_t : in STD_LOGIC_VECTOR (3 downto 0);
           io0    : inout std_logic; 
           io1    : inout std_logic; 
           io2    : inout std_logic; 
           io3    : inout std_logic; 
           clk    : in std_logic );
end io4gpio_splitter;

architecture archi of io4gpio_splitter is
begin
    io0 <= gpio_o(0) when gpio_t(0) = '0' else 'Z';
    io1 <= gpio_o(1) when gpio_t(1) = '0' else 'Z';
    io2 <= gpio_o(2) when gpio_t(2) = '0' else 'Z';
    io3 <= gpio_o(3) when gpio_t(3) = '0' else 'Z';
    gpio_i(0) <= io0;
    gpio_i(1) <= io1;
    gpio_i(2) <= io2;
    gpio_i(3) <= io3;
end archi;

---------------------------------------------------------------------
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- GPIO splitter
entity io2gpio_splitter is
    Port ( gpio_i : out STD_LOGIC_VECTOR (1 downto 0);
           gpio_o : in STD_LOGIC_VECTOR (1 downto 0);
           gpio_t : in STD_LOGIC_VECTOR (1 downto 0);
           io0    : inout std_logic; 
           io1    : inout std_logic; 
           clk    : in std_logic );
end io2gpio_splitter;

architecture archi of io2gpio_splitter is
begin
    io0 <= gpio_o(0) when gpio_t(0) = '0' else 'Z';
    io1 <= gpio_o(1) when gpio_t(1) = '0' else 'Z';
    gpio_i(0) <= io0;
    gpio_i(1) <= io1;
end archi;


----------------------------------------------------------
---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- GPIO splitter
entity i2o2io4gpio_splitter is
    Port ( gpio_i : out STD_LOGIC_VECTOR (7 downto 0);
           gpio_o : in STD_LOGIC_VECTOR (7 downto 0);
           gpio_t : in STD_LOGIC_VECTOR (7 downto 0);
           i0    : in std_logic; 
           i1    : in std_logic; 
           o2    : out std_logic; 
           o3    : out std_logic; 
           io4    : inout std_logic; 
           io5    : inout std_logic; 
           io6    : inout std_logic; 
           io7    : inout std_logic; 
           clk    : in std_logic );
end i2o2io4gpio_splitter;

architecture archi of i2o2io4gpio_splitter is
begin
    gpio_i(0) <= i0;
    gpio_i(1) <= i1;
    o2 <= gpio_o(2);
    o3 <= gpio_o(3);
    io4 <= gpio_o(4) when gpio_t(4) = '0' else 'Z';
    io5 <= gpio_o(5) when gpio_t(5) = '0' else 'Z';
    io6 <= gpio_o(6) when gpio_t(6) = '0' else 'Z';
    io7 <= gpio_o(7) when gpio_t(7) = '0' else 'Z';    
    gpio_i(4) <= io4;
    gpio_i(5) <= io5;
    gpio_i(6) <= io6;
    gpio_i(7) <= io7;
end archi;

----------------------------------------------------------
---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- GPIO splitter
entity i1o1io2gpio_splitter is
    Port ( gpio_i : out STD_LOGIC_VECTOR (3 downto 0);
           gpio_o : in STD_LOGIC_VECTOR (3 downto 0);
           gpio_t : in STD_LOGIC_VECTOR (3 downto 0);
           i0    : in std_logic; 
           o1    : out std_logic; 
           io2    : inout std_logic; 
           io3    : inout std_logic; 
           clk    : in std_logic );
end i1o1io2gpio_splitter;

architecture archi of i1o1io2gpio_splitter is
begin
    gpio_i(0) <= i0;
    o1 <= gpio_o(1);
    io2 <= gpio_o(2) when gpio_t(2) = '0' else 'Z';
    io3 <= gpio_o(3) when gpio_t(3) = '0' else 'Z';
    gpio_i(2) <= io2;
    gpio_i(3) <= io3;    
end archi;

----------------------------------------------------------
---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- GPIO splitter
entity iv2ov2gpio_splitter is
    Port ( gpio_i : out STD_LOGIC_VECTOR (3 downto 0);
           gpio_o : in STD_LOGIC_VECTOR (3 downto 0);
           i      : in STD_LOGIC_VECTOR (1 downto 0);
           o      : out STD_LOGIC_VECTOR (1 downto 0));
end iv2ov2gpio_splitter;

architecture archi of iv2ov2gpio_splitter is
begin
    gpio_i(1 downto 0) <= i;
    o <= gpio_o(3 downto 2);
end archi;

----------------------------------------------------------
---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- GPIO splitter
entity i4v2x2o4v2x2gpio_splitter is
    Port ( gpio_i : out STD_LOGIC_VECTOR (15 downto 0);
           gpio_o : in STD_LOGIC_VECTOR (15 downto 0);
           i0    : in std_logic; 
           i1    : in std_logic; 
           i2    : in std_logic; 
           i3    : in std_logic; 
           o0    : out std_logic; 
           o1    : out std_logic; 
           o2    : out std_logic; 
           o3    : out std_logic; 
           iv0      : in STD_LOGIC_VECTOR (1 downto 0);
           iv1      : in STD_LOGIC_VECTOR (1 downto 0);
           ov0      : out STD_LOGIC_VECTOR (1 downto 0);
           ov1      : out STD_LOGIC_VECTOR (1 downto 0));
end i4v2x2o4v2x2gpio_splitter;

architecture archi of i4v2x2o4v2x2gpio_splitter is
begin
    gpio_i(0) <= i0;
    gpio_i(1) <= i1;
    gpio_i(2) <= i2;
    gpio_i(3) <= i3;
    gpio_i(5 downto 4) <= iv0;
    gpio_i(7 downto 6) <= iv1;
    o0 <= gpio_o(8);
    o1 <= gpio_o(9);
    o2 <= gpio_o(10);
    o3 <= gpio_o(11);
    ov0 <= gpio_o(13 downto 12);
    ov1 <= gpio_o(15 downto 14);
end archi;

----------------------------------------------------------
---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity se_mux is
    Port ( gpio_i   : out std_logic_vector (3 downto 0);
           gpio_o   : in  std_logic_vector (3 downto 0);
           spi_clk  : in  std_logic;
           spi_mosi : in  std_logic;
           spi_miso : out std_logic;
           L2       : inout std_logic;
           L1       : out std_logic);
end se_mux;

architecture arch2 of se_mux is
begin
    L1         <= gpio_o(0)  when gpio_o(3 downto 2) = "00" else spi_clk;
    gpio_i(0)  <= L2         when gpio_o(3 downto 2) = "00" else '1';
    L2         <= spi_mosi   when gpio_o(3 downto 2) = "01" else 'Z';
    spi_miso   <= L2         when gpio_o(3 downto 2) = "10" else '1';
--    gpio_i(1)  <= gpio_o(0)  when gpio_o(3 downto 2) = "00" else '1';
end arch2;

---------------------------------------------
------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mcu_mux is
    Port ( gpio_i   : out std_logic_vector (3 downto 0);
           gpio_o   : in  std_logic_vector (3 downto 0);
           spi_clk  : out std_logic;
           spi_mosi : out std_logic;
           spi_miso : in std_logic;
           L2       : inout std_logic;
           L1       : in std_logic);
end mcu_mux;


architecture arch2 of mcu_mux is
signal sel : std_logic_vector (2 downto 0);
begin
    gpio_i(0) <= L1        when gpio_o(3 downto 2) = "00" else 'Z';
    L2        <= gpio_o(0) when gpio_o(3 downto 2) = "00" else spi_miso when gpio_o(3 downto 2) = "10" else 'Z';
    spi_clk   <= L1        when gpio_o(3 downto 2) = "01" or sel = "10" else 'Z';
    spi_mosi  <= L2        when gpio_o(3 downto 2) = "01" else 'Z';
--    gpio_i(1) <= gpio_o(0) when gpio_o(3 downto 2) = "00" else '1';
end arch2;

