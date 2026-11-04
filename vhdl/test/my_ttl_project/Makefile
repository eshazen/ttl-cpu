#
# build and run a GHDL simulation
#

# run GHDL
GHDLRUN = /usr/bin/ghdl
GTKWAVE = /usr/bin/gtkwave

GHDLOPT = --ieee=synopsys --std=08
GHDLA = $(GHDLRUN) -a $(GHDLOPT)
GHDLE = $(GHDLRUN) -e $(GHDLOPT)
GHDLR = $(GHDLRUN) -r $(GHDLOPT)

all: lib top alu

# re-compile ttl library
lib:
	rm -f sim/*.cf
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLPkg.vhd 
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLPrivatePkg.vhd 
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLParts.vhd 

top:
	ghdl -a -Psim --std=08 top_tb.vhd 
	ghdl -e -Psim --std=08 top_tb
	ghdl -r -Psim --std=08 top_tb --stop-time=4us --wave=top_tb.ghw

alu:
	ghdl -a -Psim --std=08 alu_tb.vhd 
	ghdl -e -Psim --std=08 alu_tb
	ghdl -r -Psim --std=08 alu_tb --stop-time=4us --wave=alu_tb.ghw


view: top_tb.ghw top_tb.tcl
	gtkwave top_tb.ghw -S top_tb.tcl

view_alu: alu_tb.ghw alu_tb.tcl
	gtkwave alu_tb.ghw -S alu_tb.tcl

clean:
	rm -f sim/*.cf *~ *.cf *.vcd *.ghw *.db *.ready
