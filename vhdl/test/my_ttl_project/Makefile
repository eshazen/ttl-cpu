
all:
	rm -f sim/*.cf
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLPkg.vhd 
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLPrivatePkg.vhd 
	ghdl -a --std=08 --work=ttl_library --workdir=sim ttl_lib/TTLParts.vhd 
	ghdl -a -Psim --std=08 top_tb.vhd 
