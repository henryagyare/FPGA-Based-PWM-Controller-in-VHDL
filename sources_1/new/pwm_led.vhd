library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pwm_led is
  generic (
    pwm_bits : integer := 8;
    cnt_bits : integer := 25;
    clk_cnt_len : positive := 47
  );
  port (
    clk : in std_logic;
    rst_n : in std_logic;
    led_1 : out std_logic;
    led_2 : out std_logic;
    led_3 : out std_logic;
    led_4 : out std_logic;
    led_5 : out std_logic
  );
end pwm_led;

architecture str of pwm_led is
  signal rst : std_logic;
  signal cnt : unsigned(cnt_bits - 1 downto 0);
  signal pwm_out : std_logic;
  alias duty_cycle is cnt(cnt'high downto cnt'length - pwm_bits);
begin
  led_1 <= '0';
  led_2 <= '0';
  led_3 <= '0';
  led_4 <= '0';
  led_5 <= pwm_out;

  RESET : entity work.reset(rtl)
    port map (
      clk => clk,
      rst_n => rst_n,
      rst => rst
    );

  PWM : entity work.pwm(rtl)
    generic map (
      pwm_bits => pwm_bits,
      clk_cnt_len => clk_cnt_len
    )
    port map (
      clk => clk,
      rst => rst,
      duty_cycle => duty_cycle,
      pwm_out => pwm_out
    );

  COUNTER : entity work.counter(rtl)
    generic map (
      counter_bits => cnt'length
    )
    port map (
      clk => clk,
      rst => rst,
      count_enable => '1',
      counter => cnt
    );
end str;
