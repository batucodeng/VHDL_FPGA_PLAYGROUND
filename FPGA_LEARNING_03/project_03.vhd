library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project_03 is
Port (
s0 : in std_logic_vector(7 downto 0);
s1 : in std_logic_vector(7 downto 0);
s2 : out STD_LOGIC
);
end project_03;

architecture Behavioral of project_03 is 

signal s3 : integer range 0 to 511 := 0;

begin 

s3 <= to_integer(unsigned(s0) + unsigned(s1));

process (s3) begin
if (s3>20) then
s2 <= '1';
else 
s2 <= '0';
end if;

end process;
end Behavioral;