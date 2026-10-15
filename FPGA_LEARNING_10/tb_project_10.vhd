library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_project_10 is
end tb_project_10;

architecture Behavioral of tb_project_10 is
signal tb_bcd_in : std_logic_vector(3 downto 0) := "0000";
signal tb_seg_out : std_logic_vector(6 downto 0);

constant step_time : time := 20 ns;

begin 
uut: entity work.project_10
port map (
bcd_in => tb_bcd_in,
seg_out => tb_seg_out
);

stim_proc : process
begin
for i in 0 to 9 loop
tb_bcd_in <= std_logic_vector(to_unsigned(i, 4));
wait for step_time;
end loop;

tb_bcd_in <= "1100";
wait for step_time;
wait;
end process;
end Behavioral;