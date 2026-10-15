library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity project_10 is
port (
bcd_in : in std_logic_vector(3 downto 0);-- in edilecek sayı 0la 9 arası karistirma
seg_out : out std_logic_vector(6 downto 0)-- 7 segment cikis (aktif-dusuk: g-f-e-d-c-b-a)
);
end project_10;

architecture Behavioral of project_10 is
begin

process(bcd_in)
begin 
case bcd_in is
when "0000" => seg_out <= "1000000";
when "0001" => seg_out <= "1111001";
when "0010" => seg_out <= "0100100";
when "0011" => seg_out <= "0110000";
when "0100" => seg_out <= "0011001";
when "0101" => seg_out <= "0010010";
when "0110" => seg_out <= "0000010";
when "0111" => seg_out <= "1111000";
when "1000" => seg_out <= "0000000";
when "1001" => seg_out <= "0010000";
when others => seg_out <= "1111111"; -- 9'dan buyuk olunca ekrani sondur
end case;
end process;

end Behavioral;
