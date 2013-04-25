#!/usr/bin/perl -w

use strict;
use SNMP::Trapinfo;
use Data::Dumper;

my $trap;
my $timestamp = localtime(time);

open (LOG,">>/tmp/mac-trap.log") or die "Can't open logfile: $!\n";
print LOG "$timestamp recieved trap.\n";
while ($trap = SNMP::Trapinfo->new(*STDIN)) {
	print LOG $trap->packet."\n";
}
close LOG;

