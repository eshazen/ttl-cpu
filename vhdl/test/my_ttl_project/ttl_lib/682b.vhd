
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SN74LS682N is
    generic (
        T_PD_EQ : time := 25 ns;
        T_PD_GT : time := 30 ns
    );
    port (
        X_1  : out   std_logic;  -- P > Q (active low)
        X_2  : in    std_logic;  -- P0
        X_3  : in    std_logic;  -- Q0
        X_4  : in    std_logic;  -- P1
        X_5  : in    std_logic;  -- Q1
        X_6  : in    std_logic;  -- P2
        X_7  : in    std_logic;  -- Q2
        X_8  : in    std_logic;  -- P3
        X_9  : in    std_logic;  -- Q3
        X_10 : in    std_logic;  -- GND
        X_11 : in    std_logic;  -- P4
        X_12 : in    std_logic;  -- Q4
        X_13 : in    std_logic;  -- P5
        X_14 : in    std_logic;  -- Q5
        X_15 : in    std_logic;  -- P6
        X_16 : in    std_logic;  -- Q6
        X_17 : in    std_logic;  -- P7
        X_18 : in    std_logic;  -- Q7
        X_19 : out   std_logic;  -- P = Q (active low)
        X_20 : in    std_logic   -- VCC
    );
end entity SN74LS682N;

architecture Behavioral of SN74LS682N is

    signal P : std_logic_vector(7 downto 0);
    signal Q : std_logic_vector(7 downto 0);

begin

    -- Assemble the two 8-bit words.
    P(0) <= X_2;
    P(1) <= X_4;
    P(2) <= X_6;
    P(3) <= X_8;
    P(4) <= X_11;
    P(5) <= X_13;
    P(6) <= X_15;
    P(7) <= X_17;

    Q(0) <= X_3;
    Q(1) <= X_5;
    Q(2) <= X_7;
    Q(3) <= X_9;
    Q(4) <= X_12;
    Q(5) <= X_14;
    Q(6) <= X_16;
    Q(7) <= X_18;

    -- Active-low comparison outputs.
    -- Propagation delays are modeled using inertial delays.

    X_19 <= '0' after T_PD_EQ
            when P = Q else
            '1' after T_PD_EQ;

    X_1 <= '0' after T_PD_GT
           when unsigned(P) > unsigned(Q) else
           '1' after T_PD_GT;

end architecture Behavioral;
