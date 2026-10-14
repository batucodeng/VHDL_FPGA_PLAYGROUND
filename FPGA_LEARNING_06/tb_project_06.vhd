library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_project_06 is 
end tb_project_06;

architecture Behavioral of tb_project_06 is
signal tb_clk_in : std_logic := '0';
signal tb_rst : std_logic := '0';
signal tb_clk_out : std_logic;

constant clk_period : time := 20 ns;

begin 

uut: entity work.project_06
generic map (
DIVISOR => 4
)
port map (
clk_in => tb_clk_in,
rst => tb_rst,
clk_out => tb_clk_out
);

clk_process : process
begin 
tb_clk_in <= '0';
wait for clk_period / 2;
tb_clk_in <= '1';
wait for clk_period / 2;
end process;

stim_proc: process
begin
tb_rst <= '1';
wait for 25 ns;
tb_rst <= '0';
wait for 300 ns;
tb_rst <= '1';
wait for 20 ns;
tb_rst <= '0';
wait for 150 ns;

wait;
end process;
end Behavioral;