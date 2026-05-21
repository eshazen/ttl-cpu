# TTL CPU

Yet another TTL CPU.  Inspired by the fact that I have boxes of
leftover TTL chips from the EDF, including a bunch of 74LS181 ALUs.

Also would really like to have a computer I built completely from
scratch at the gate level and which runs some "useful" software.

## Early explorations

Found `logisim-evolution`, which is a seemingly competent simulator
with a comprehensive TTL library.  It has testbench support and even
VHDL support.  If it isn't too buggy it could simulate and entire CPU.

Some issues/limitations:

* TTL parts have only "chip icon" representations.  But can wrap them
  as subcircuits.
  
