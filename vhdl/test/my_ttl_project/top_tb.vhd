
library ieee;
use ieee.std_logic_1164.all;

library ttl_library;
use ttl_library.all;

entity top_tb is
end entity;

architecture sim of top_tb is

  signal clk, rst, q, not_q : std_logic;

begin

    rst <= '0', '1' after 37 ns;
  not_q <= not q;

  process

  begin

    clk <= '0';
    wait for 100 ns;
    clk <= '1';
    wait for 100 ns;

  end process;

  SN74LS74N_1: entity ttl_library.SN74LS74N
    port map (
      X_1  => '1',
      X_2  => not_q,
      X_3  => clk,
      X_4  => '1',
      X_5  => q,
      X_6  => open,
      X_7  => open,
      X_8  => open,
      X_9  => open,
      X_10 => '1',
      X_11 => '1',
      X_12 => '1',
      X_13 => '1',
      X_14 => open);

    

end architecture;
