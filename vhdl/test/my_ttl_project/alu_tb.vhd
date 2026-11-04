
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ttl_library;
use ttl_library.all;

entity alu_tb is
end entity;

architecture sim of alu_tb is

  signal a, b, f, s : std_logic_vector(3 downto 0);
  signal cn, m, eq, p, g, cn4 : std_logic;

begin

  a <= X"7";
  b <= X"4";
  m <= '0';
  cn <= '1';
  
  process
  begin

    for i in 0 to 15 loop
      s <= std_logic_vector(to_unsigned(i, s'length));
      wait for 200 ns;
    end loop;
    
  end process;

  SN74LS181N_1: entity ttl_library.SN74LS181N
    port map (
      X_1  => b(0),      -- B0\   
      X_2  => a(0),      -- A0\   
      X_3  => s(3),      -- S3    
      X_4  => s(2),      -- S2    
      X_5  => s(1),      -- S1    
      X_6  => s(0),      -- S0    
      X_7  => cn,      -- Cn    
      X_8  => m,      -- M     
      X_9  => f(0),      -- F0\   
      X_10 => f(1),     -- F1\   
      X_11 => f(2),     -- F2\   
      X_12 => open,     -- GND   
      X_13 => f(3),     -- F3\   
      X_14 => eq,     -- A=B   
      X_15 => p,     -- P\    
      X_16 => cn4,     -- Cn+4  
      X_17 => g,     -- G\    
      X_18 => b(3),     -- B3\   
      X_19 => a(3),     -- A3\   
      X_20 => b(2),     -- B2\   
      X_21 => a(2),     -- A2\   
      X_22 => b(1),     -- B1\   
      X_23 => a(1),     -- A1\   
      X_24 => open);    -- Vcc   


end architecture;
