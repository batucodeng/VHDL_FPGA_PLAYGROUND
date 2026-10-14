library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project_07 is
port (
clk : in std_logic;
rst : in std_logic;
shift_en : in std_logic;
serial_in : in std_logic;
parallel_out : out std_logic_vector(3 downto 0)
);
end project_07;

architecture Behavioral of project_07 is
signal r_shift : std_logic_vector(3 downto 0) := (others => '0');

begin 
process(clk, rst)
begin 
if (rst = '1') then
r_shift <= (others => '0');
elsif rising_edge(clk) then
if(shift_en = '1') then
r_shift <= r_shift(2 downto 0) & serial_in;
end if;
end if;
end process;
parallel_out <= r_shift;
end Behavioral;
