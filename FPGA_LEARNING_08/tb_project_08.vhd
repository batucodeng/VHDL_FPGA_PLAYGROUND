library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_project_08 is
end tb_project_08;

architecture Behavioral of tb_project_08 is

signal tb_clk : std_logic := '0';
signal tb_rst : std_logic := '0';
signal tb_red_led : std_logic;
signal tb_yellow_led : std_logic;
signal tb_green_led : std_logic;

constant clk_period : time := 20 ns;

begin

uut: entity work.project_08
port map (
clk => tb_clk,
rst => tb_rst,
red_led => tb_red_led,
yellow_led => tb_yellow_led,
green_led => tb_green_led
);

clk_process : process 
begin 
tb_clk <= '0';
wait for clk_period / 2;
tb_clk <= '1';
wait for clk_period / 2;
end process;

stim_proc : process
begin 

tb_rst <= '1';
wait for 25 ns;
tb_rst <= '0';
wait for 200 ns;

tb_rst <= '1';
wait for 20 ns;
tb_rst <= '0';
wait for 100 ns;
wait;
end process;

end Behavioral;