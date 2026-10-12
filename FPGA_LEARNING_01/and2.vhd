library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_and_gate is
    port ( 
        in_1  : in  STD_LOGIC;
        in_2  : in  STD_LOGIC;
        and_1 : out STD_LOGIC
    );
end my_and_gate;

architecture Behavioral of my_and_gate is 
begin 
    and_1 <= in_1 and in_2;
end Behavioral;