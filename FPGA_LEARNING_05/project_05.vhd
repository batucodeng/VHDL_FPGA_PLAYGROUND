library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project_05 is
port (
clk : in std_logic;
rst : in std_logic;
en  : in std_logic;
count_out : out std_logic_vector(3 downto 0)
);
end project_05;

architecture Behavioral of project_05 is 

signal r_count : unsigned(3 downto 0) := (others => '0');

begin 
process(clk, rst)
begin 
if(rst = '1') then
r_count <= (others => '0');
elsif rising_edge(clk) then
if (en = '1') then
r_count <= r_count + 1;
end if;

end if;
end process;

count_out <= std_logic_vector(r_count);

end Behavioral;
