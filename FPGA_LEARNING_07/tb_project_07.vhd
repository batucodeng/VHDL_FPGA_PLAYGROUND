library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_project_07 is
end tb_project_07;

architecture Behavioral of tb_project_07 is

signal tb_clk : std_logic := '0';
signal tb_rst : std_logic := '0';
signal tb_shift_en : std_logic := '0';
signal tb_serial_in : std_logic := '0';
signal tb_parallel_out : std_logic_vector(3 downto 0);

constant clk_period : time := 20 ns;

begin 
uut: entity work.project_07
port map (
clk => tb_clk,
rst => tb_rst,
shift_en => tb_shift_en,
serial_in => tb_serial_in,
parallel_out => tb_parallel_out
);

clk_process : process
begin
tb_clk <= '0';
wait for clk_period / 2;
tb_clk <= '1';
wait for clk_period / 2;
end process;

stim_proc: process
begin
tb_rst <= '1';
wait for 25 ns;
tb_rst <= '0';
wait for 15 ns;

tb_shift_en <= '1';

tb_serial_in <= '1';
wait for clk_period;

tb_serial_in <= '0';
wait for clk_period;

tb_serial_in <= '1';
wait for clk_period;

tb_shift_en <= '0';
wait for 40 ns;

tb_rst <= '1';
wait for 20 ns;
tb_rst <= '0';

wait for 40 ns;
wait;
end process;
end Behavioral;

