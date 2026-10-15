library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity project_08 is
port (
clk : in std_logic;
rst : in std_logic;
red_led : out std_logic;
yellow_led : out std_logic;
green_led : out std_logic
);
end project_08;

architecture Behavioral of project_08 is
type t_state is (RED, YELLOW, GREEN);
signal current_state : t_state := RED;
signal next_state : t_state;

begin

state_reg : process(clk, rst)
begin 
if (rst = '1') then 
current_state <= RED;
elsif rising_edge(clk) then
current_state <= next_state;
end if;
end process;

comb_logic : process(current_state)
begin 
red_led <= '0';
yellow_led <= '0';
green_led <= '0';

case current_state is 
when RED => 
red_led <= '1';
next_state <= YELLOW;

when YELLOW =>
yellow_led <= '1';
next_state <= GREEN;

when GREEN =>
green_led <= '1';
next_state <= RED;

when others =>
next_state <= RED;
end case;
end process;
end Behavioral;
