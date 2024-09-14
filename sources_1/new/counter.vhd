-- Counter entity should be defined here. This is a placeholder.
-- Replace with actual implementation.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
  generic (
    counter_bits : integer := 16
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    count_enable : in std_logic;
    counter : out unsigned(counter_bits - 1 downto 0)
  );
end counter;

architecture rtl of counter is
  signal cnt : unsigned(counter_bits - 1 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        cnt <= (others => '0');
      elsif count_enable = '1' then
        cnt <= cnt + 1;
      end if;
    end if;
  end process;
  counter <= cnt;
end rtl;
