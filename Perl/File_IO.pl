######################################
#
#	by: Patrick Stockton
#
#	This program reads a line of text 
#	from the user, break up each line 
#	into single words, and writes to file.
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print ("Written by: Patrick Stockton\n\n");
print ("This program reads a line of text from the user, break up each line into single words, and writes to file.\n");

open(OUT, '>', 'example.txt') or die $!;

my $exit_loop = "STOP";

#This loop takes inputs, tests if the user inputs "STOP", and writes each word on it's own line to the example.txt file
while (<>) {
	chomp($_);
	if ($_ eq $exit_loop) { # test for STOP
		last;
	} else {
		foreach my $word(split) {
			print OUT $word."\n";
		}
	}
	#print OUT $_;

}

close OUT;