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

all: lib top

# re-compile ttl library
lib:
	rm -f sim/*.cf
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLPkg.vhd 
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLPrivatePkg.vhd 
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLParts.vhd 

top:
	ghdl -a -Psim --std=08 netlist.vhd 
	ghdl -e -Psim --std=08 netlist
	ghdl -r -Psim --std=08 netlist --stop-time=4us --wave=netlist.ghw

view: netlist.ghw netlist.tcl
	gtkwave netlist.ghw -S netlist.tcl

clean:
	rm -f sim/*.cf *~ *.cf *.vcd *.ghw *.db *.ready
