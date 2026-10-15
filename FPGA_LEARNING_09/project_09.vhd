library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project_09 is
generic (
PERIOD : integer := 10 --pwmdeki clock sayisi unutma
);
port (
clk : in std_logic;
rst : in std_logic;
duty : in integer range 0 to PERIOD;
pwm_out : out std_logic
);
end project_09;

architecture Behavioral of project_09 is
signal counter : integer range 0 to PERIOD - 1 := 0;

begin 

process(clk, rst)
begin
if (rst = '1') then
counter <= 0;
elsif rising_edge(clk) then
if(counter = PERIOD - 1) then
counter <= 0;
else 
counter <= counter + 1;
end if;
end if;
end process;
pwm_out <= '1' when (counter < duty) else '0';
end Behavioral;