library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_project_03 is
end tb_project_03;

architecture Behavioral of tb_project_03 is

    signal tb_s0 : std_logic_vector(7 downto 0) := (others => '0');
    signal tb_s1 : std_logic_vector(7 downto 0) := (others => '0');
    signal tb_s2 : std_logic;

begin

    uut: entity work.project_03
    port map (
        s0 => tb_s0,
        s1 => tb_s1,
        s2 => tb_s2
    );

    stim_proc: process
    begin
        tb_s0 <= std_logic_vector(to_unsigned(0, 8));
        tb_s1 <= std_logic_vector(to_unsigned(0, 8));
        wait for 20 ns;

        tb_s0 <= std_logic_vector(to_unsigned(5, 8));
        tb_s1 <= std_logic_vector(to_unsigned(10, 8));
        wait for 20 ns;

        tb_s0 <= std_logic_vector(to_unsigned(10, 8));
        tb_s1 <= std_logic_vector(to_unsigned(10, 8));
        wait for 20 ns;

        tb_s0 <= std_logic_vector(to_unsigned(11, 8));
        tb_s1 <= std_logic_vector(to_unsigned(10, 8));
        wait for 20 ns;
		
        tb_s0 <= std_logic_vector(to_unsigned(60, 8));
        tb_s1 <= std_logic_vector(to_unsigned(40, 8));
        wait for 20 ns;

        wait;
    end process;

end Behavioral;