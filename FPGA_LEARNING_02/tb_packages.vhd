library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_packages is

end tb_packages;

architecture Behavioral of tb_packages is

    component packages
        Port (
            s0 : in  std_logic_vector(7 downto 0);
            s1 : in  std_logic_vector(7 downto 0);
            s2 : out STD_LOGIC
        );
    end component;

    signal tb_s0 : std_logic_vector(7 downto 0) := (others => '0');
    signal tb_s1 : std_logic_vector(7 downto 0) := (others => '0');
    signal tb_s2 : std_logic;

begin

    uut: packages
        port map (
            s0 => tb_s0,
            s1 => tb_s1,
            s2 => tb_s2
        );

    stim_proc: process
    begin
        tb_s0 <= std_logic_vector(to_unsigned(5, 8));
        tb_s1 <= std_logic_vector(to_unsigned(10, 8));
        wait for 20 ns;

        tb_s0 <= std_logic_vector(to_unsigned(10, 8));
        tb_s1 <= std_logic_vector(to_unsigned(10, 8));
        wait for 20 ns;

        tb_s0 <= std_logic_vector(to_unsigned(15, 8));
        tb_s1 <= std_logic_vector(to_unsigned(10, 8));
        wait for 20 ns;

        tb_s0 <= std_logic_vector(to_unsigned(0, 8));
        tb_s1 <= std_logic_vector(to_unsigned(50, 8));
        wait for 20 ns;

        tb_s0 <= std_logic_vector(to_unsigned(0, 8));
        tb_s1 <= std_logic_vector(to_unsigned(0, 8));
        wait for 20 ns;

        wait;
    end process;

end Behavioral;