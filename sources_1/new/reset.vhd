-- Reset entity should be defined here. This is a placeholder.
-- Replace with actual implementation.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reset is
  port (
    clk : in std_logic;
    rst_n : in std_logic;
    rst : out std_logic
  );
end reset;

architecture rtl of reset is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst_n = '0' then
        rst <= '1';
      else
        rst <= '0';
      end if;
    end if;
  end process;
end rtl;
