######################################
#
#	by: Patrick Stockton
#
#	This program allows the user to input 
#	a line of words, and prints out the 
#	first word that ends with a \'g\'.
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print ("Written by: Patrick Stockton\n\n");
print ("This program allows the user to input a line of words, and prints out the first word that ends with a \'g\'.\n");

while (<>) {
	print ("\n--------------------------------\n");
	foreach my $word(split) {
		if ($word =~ /g$/) {
			print ($word, "\n");
			print ("--------------------------------\n");
			last;
		}
	}

}