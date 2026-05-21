# TTL CPU

Yet another TTL CPU.  Inspired by the fact that I have boxes of
leftover TTL chips from the EDF, including a bunch of 74LS181 ALUs.

Also would really like to have a computer I built completely from
scratch at the gate level and which runs some "useful" software.

## Resources

* [Stack Computers](https://users.ece.cmu.edu/~koopman/stack_computers/index.html):
  the new wave, P. Koopman
* [TOM-1](https://hackaday.io/project/171965-ttl-operation-module-tom-1)
  project on Hackaday
* [CPUville](http://cpuville.com/index.html) site with various
  including a TTL 8-bit CPU
* [SCAMP](https://github.com/jes/scamp-cpu) CPU project with some
  great software
* ["CPU made out of TTL chips only"](https://www.qsl.net/ct1dmk/ttlcpu.html)
  Another very interesting design.

## Early explorations

Found `logisim-evolution`, which is a seemingly competent simulator
with a comprehensive TTL library.  It has testbench support and even
VHDL support.  If it isn't too buggy it could simulate and entire CPU.

Some issues/limitations:

* TTL parts have only "chip icon" representations.  But can wrap them
  as subcircuits.
  
