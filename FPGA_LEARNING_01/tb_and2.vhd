library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and2 is

end tb_and2;

architecture Behavioral of tb_and2 is

    component my_and_gate
        port (
            in_1  : in  STD_LOGIC;
            in_2  : in  STD_LOGIC;
            and_1 : out STD_LOGIC
        );
    end component;

    signal s_in_1  : STD_LOGIC := '0';
    signal s_in_2  : STD_LOGIC := '0';
    signal s_and_1 : STD_LOGIC;

begin

    uut: my_and_gate
        port map (
            in_1  => s_in_1,
            in_2  => s_in_2,
            and_1 => s_and_1
        );

    stim_proc: process
    begin
        s_in_1 <= '0'; s_in_2 <= '0';
        wait for 20 ns;

        s_in_1 <= '0'; s_in_2 <= '1';
        wait for 20 ns;

        s_in_1 <= '1'; s_in_2 <= '0';
        wait for 20 ns;

        s_in_1 <= '1'; s_in_2 <= '1';
        wait for 20 ns;

        wait;
    end process;

end Behavioral;