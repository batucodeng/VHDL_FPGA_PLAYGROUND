library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_project_05 is 
end tb_project_05;

architecture Behavioral of tb_project_05 is

signal tb_clk : std_logic := '0';
signal tb_rst : std_logic := '0';
signal tb_en  : std_logic := '0';
signal tb_count_out : std_logic_vector(3 downto 0);

constant clk_period : time := 20 ns;

begin 

	uut: entity work.project_05
	port map (
		clk => tb_clk,
		rst => tb_rst,
		en => tb_en,
		count_out => tb_count_out
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
		
		tb_en <= '1';
		wait for 200 ns;
		tb_en <= '0';
		wait for 60 ns;
		tb_en <= '1';
		wait for 200 ns;
		tb_rst <= '1';
		wait for 20 ns;
		tb_rst <= '0';
		
		wait;
	end process;
	
end Behavioral;