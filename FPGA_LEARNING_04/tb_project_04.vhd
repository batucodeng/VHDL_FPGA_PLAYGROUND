library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_project_04 is
end tb_project_04;

architecture Behavioral of tb_project_04 is 

signal tb_clk : std_logic := '0';
signal tb_rst : std_logic := '0';
signal tb_data_in : std_logic := '0';
signal tb_data_out : std_logic;

constant clk_period : time := 20 ns;

begin 

uut: entity work.project_04
port map (
clk => tb_clk,
rst => tb_rst,
data_in => tb_data_in, 
data_out => tb_data_out
);

clk_process : process
begin 
	tb_clk <= '0';
	wait for clk_period/2;
	tb_clk <= '1';
	wait for clk_period / 2;
end process;

stim_proc: process
begin

tb_rst <= '1';
wait for 25 ns;
tb_rst <= '0';
wait for 15 ns;
tb_data_in <= '1';
wait for 40 ns;
tb_data_in <= '0';
wait for 40 ns;
tb_data_in <= '1';
wait for 20 ns;
tb_rst <= '1';
wait for 20 ns;
tb_rst <= '0';
wait;
end process;
end Behavioral;
