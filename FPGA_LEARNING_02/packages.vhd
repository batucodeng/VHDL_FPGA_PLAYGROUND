library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity packages is
Port (
s0 : in std_logic_vector(7 downto 0);
s1 : in std_logic_vector(7 downto 0);
s2 : out STD_LOGIC
);
end packages;

architecture Behavioral of packages is

signal s3 : unsigned (7 downto 0) := x"00";

begin 

s3 <= unsigned(s0) + unsigned(s1);

process (s3) begin

if (s3 > 20) then
s2 <= '1';
else 
s2 <= '0';
end if;

end process;

end Behavioral;