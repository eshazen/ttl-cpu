#!/usr/bin/perl

use XML::LibXML;
use Data::Dumper;

open my $fh, '<', $ARGV[0] or die "Opening " . $ARGV[0];
binmode $fh;

$doc = XML::LibXML->load_xml( IO => $fh);

my @comps = $doc->findnodes('//comp');

foreach $c ( @comps ) {
    my $val = $c->findvalue('value');
    print "value = $val\n";
    my @allunits = $c->findnodes('./units');
    foreach $unit ( @allunits) {
	my @units = $unit->findnodes( './unit');
	foreach $unit ( @units) {
	    print "UNIT:\n", $unit, "\n";
	}
    }
}
