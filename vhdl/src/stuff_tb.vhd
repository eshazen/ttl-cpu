
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

use work.LSTTL.all;
use work.TTLPrivate.all;

entity stuff_tb is
  
end entity stuff_tb;


architecture arch of stuff_tb is

  component stuff is
    port (
      clk : in  std_logic;
      rst : in  std_logic;
      q   : out std_logic);
  end component stuff;

  signal clk, rst, q, not_q : std_logic;

begin  -- architecture arch

  rst <= '0', '1' after 37 ns;
  not_q <= not q;

  process

  begin

    clk <= '0';
    wait for 100 ns;
    clk <= '1';
    wait for 100 ns;

  end process;

  SN74LS74N_1: entity work.SN74LS74N
    generic map (
      tSETUP => tSETUP,
      tPLHCP => tPLHCP,
      tPHLCP => tPHLCP,
      tPLHSC => tPLHSC,
      tPHLSC => tPHLSC)
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
      X_10 => open,
      X_11 => open,
      X_12 => open,
      X_13 => open,
      X_14 => open);

end architecture arch;
