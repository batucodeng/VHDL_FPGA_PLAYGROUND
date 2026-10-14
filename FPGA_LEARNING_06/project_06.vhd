library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project_06 is
generic (
divisor : integer := 4
);
port (
clk_in : in std_logic;
rst : in std_logic;
clk_out : out std_logic
);
end project_06;

architecture Behavioral of project_06 is
signal counter : integer range 0 to divisor -1 := 0;
signal r_clk : std_logic := '0';
begin 
process(clk_in,rst)
begin 
if(rst = '1') then
counter <= 0;
r_clk <= '0';
elsif rising_edge(clk_in) then
if (counter = (DIVISOR / 2)- 1) then
r_clk <= not r_clk;
counter <= counter + 1;
elsif (counter = DIVISOR - 1) then
r_clk <= not r_clk;
counter <= 0;
else
counter <= counter + 1;
end if;
end if;
end process;
clk_out <= r_clk;
end Behavioral;