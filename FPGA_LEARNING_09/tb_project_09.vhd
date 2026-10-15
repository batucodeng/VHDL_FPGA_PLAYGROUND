library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_project_09 is
end tb_project_09;

architecture Behavioral of tb_project_09 is

constant PERIOD_VAL : integer := 10;
constant clk_period : time := 20 ns;

signal tb_clk : std_logic := '0';
signal tb_rst : std_logic := '0';
signal tb_duty : integer range 0 to PERIOD_VAL := 0;
signal tb_pwm_out : std_logic;

begin 

uut: entity work.project_09
generic map (
PERIOD => PERIOD_VAL
)
port map (
clk => tb_clk,
rst => tb_rst,
duty => tb_duty,
pwm_out => tb_pwm_out
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
wait for 15 ns;

tb_duty <= 2;
wait for clk_period * 15; --1.5 periyot izliyoruz
tb_duty <= 5;
wait for clk_period * 15;
tb_duty <= 8;
wait for clk_period * 15;
tb_duty <= 0;
wait for clk_period * 10;
wait;
end process;

end Behavioral;


