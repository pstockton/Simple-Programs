######################################
#
#	by: Patrick Stockton
#
#	This program allows the user to input 
#	words and prints out any word that 
#	has 3 adjacent consonants.
#
######################################

#!/usr/bin/perl

use warnings;
use strict;

print ("Written by: Patrick Stockton\n\n");
print ("This program allows the user to input words and prints out any word that has 3 adjacent consonants.\n");

while (<>) {
	print if /[bcdfghjklmnpqrstvwxyz][bcdfghjklmnpqrstvwxyz][bcdfghjklmnpqrstvwxyz]/; 
}



