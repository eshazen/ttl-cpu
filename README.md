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
* [Stack Machine](https://www.mtmscientific.com/stack.html) by MTM Scientific.  Very interesting read.
    * [Eckert paper](Refs/Eckert_paper.html) from 1998, "MICRO-PROGRAMMED VERSUS HARDWIRED CONTROL UNITS:
HOW COMPUTERS REALLY WORK"
* "Practical Digital Design using ICs" by J. Greenfield (available at Internet Archive)

## Initial thoughts on architecture

* 16-bit address with some possibility of additional paging for expansion
* 16-bit data path, registers, ALU
* Two sizes - DS (8 bit or possibly 16 bit); AS (16 bit)

| Name | Size | Use                     | Notes                     |
|------|------|-------------------------|---------------------------|
| A    | D    | accumulator.            |                           |
| B    | D    | second operand register |                           |
| X    | A    | index register          |                           |
| SP   | A    | stack pointer           |                           |
| MAR  | A    | memory address register |                           |
| MDR  | D    | memory data register    | Can just use RAM outputs? |
| PC   | A    | program counter         |                           |
| IR   | D    | instruction register    |                           |
| F    | D    | flags                   |                           |

## Control signals

|      |   |                                |
|------|---|--------------------------------|
| LDI  |   | Load IR                        |
|      |   |                                |
| nLDP |   | Load PC                        |
| nENP |   | Output PC                      |
| INP  |   | Increment PC                   |
|      |   |                                |
| LDM  |   | Load MAR                       |
| ENM  |   | Output MAR (MAR always to RAM) |
|      |   |                                |
| MRD  |   | Output RAM (memory read)       |
| MWR  |   | Load RAM (memory write)        |
|      |   |                                |
| IOW  |   | Load IO (IO write)             |
| IOR  |   | Output IO (IO read)            |
|      |   |                                |
| LDB  |   | Load B                         |
| ENB  |   | Output B                       |
|      |   |                                |
| LDA  |   | Load A                         |
| ENA  |   | Output A                       |
|      |   |                                |
| ALE  |   | Output ALU                     |
| ALF  |   | ALU function                   |
|      |   |                                |
| LDX  |   | Load X                         |
| ENX  |   | Output X                       |
|      |   |                                |
	
## Instructions

### Fetch

    ENP, LDM      output PC to bus, load MAR
	MRD, LDI      RAM data to bus, load IR
	
	

## Tools

Found `logisim-evolution`, which is a seemingly competent simulator
with a comprehensive TTL library.  It has testbench support and even
VHDL support.  If it isn't too buggy it could simulate and entire CPU.

Some issues/limitations:

* TTL parts have only "chip icon" representations.  But can wrap them
  as subcircuits.
  
