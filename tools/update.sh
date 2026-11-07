#!/bin/bash
#
# KICADCLI=/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli
KICADCLI=/usr/bin/kicad-cli
# XSLTPROC=/usr/bin/xsltproc

$KICADCLI sch export netlist --format kicadxml CPU.kicad_sch
# $XSLTPROC -o test.vhdl ~/work/KiCad-HDL/Plugins/netlist_form_VHDL.xsl CPU.xml

