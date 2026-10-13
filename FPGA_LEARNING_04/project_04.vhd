library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity project_04 is
port (
	clk : in std_logic;
	rst : in std_logic;
	data_in : in std_logic;
	data_out : out std_logic
);
end project_04;

architecture Behavioral of project_04 is
begin 
	process(clk, rst)
	begin 
	if (rst = '1') then
	data_out <= '0';
	elsif rising_edge(clk) then
	data_out <= data_in;
	end if;
	end process;
end Behavioral;